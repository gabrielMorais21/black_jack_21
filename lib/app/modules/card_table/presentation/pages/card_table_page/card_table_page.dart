import 'dart:ui';
import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_cubit.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_state.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum GameResults {
  win("Você hanhou"),
  loss("Você perdeu"),
  draw("Empata");

  const GameResults(this.value);
  final String value;
}

class CardTablePage extends StatefulWidget {
  const CardTablePage({super.key});

  @override
  State<CardTablePage> createState() => _CardTablePageState();
}

class _CardTablePageState extends State<CardTablePage> {
  CardTableCubit cardTableCubit = injectionContainer.sl.get<CardTableCubit>();

  List<Cards> cardListCpu = [];
  List<Cards> cardListUser = [];

  int cpuScore = 0;
  int userScore = 0;

  @override
  void initState() {
    cardTableCubit.fetchShuffleCards(deckCount: "6");
    super.initState();
  }

  int calcularPontuacao(List<Cards> carta) {
    var ponto = 0;
    for (var carta in carta) {
      if (carta.value == "ACE") {
        ponto = ponto + 10;
      } else if (isNumero(carta.value ?? '')) {
        ponto = ponto + int.parse(carta.value ?? '');
      } else {
        ponto = ponto + 11;
      }
    }
    return ponto;
  }

  bool isNumero(String texto) {
    try {
      double.parse(texto);
      return true;
    } catch (e) {
      return false;
    }
  }

  void showSuccessModal(BuildContext context, {required String text, required Function callback, bool dismissible = true}) {
    showGeneralDialog(
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(opacity: anim1, child: child),
      ),
      context: context,
      barrierDismissible: dismissible,
      barrierLabel: '',
      barrierColor: Colors.black26,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (ctx, anim1, anim2) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Wrap(
                        children: [
                          Text(
                            text,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            callback();
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GameResults? validateWin() {
    if (userScore > 21 && cpuScore > 21) {
      return GameResults.draw;
    } else if (userScore == 21 && cpuScore == 21) {
      return GameResults.draw;
    } else if (cpuScore > 21) {
      return GameResults.win;
    } else if (cpuScore == 21) {
      return GameResults.loss;
    } else if (userScore > 21) {
      return GameResults.loss;
    } else if (userScore == 21) {
      return GameResults.win;
    } else {
      return null; // Empate com pontuações iguais.
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardTableCubit, CardTableState>(
        bloc: cardTableCubit,
        listener: (context, state) async {
          if (state is DrawCardSuccessState) {
            cardListUser.add(state.cardModel.cards![0]);
            cardListCpu.add(state.cardModel.cards![1]);
            userScore = calcularPontuacao(cardListUser);
            cpuScore = calcularPontuacao(cardListCpu);
            var result = validateWin();
            if (result != null) showSuccessModal(context, text: result.value, callback: () async {});
          }

          if (state is ShuffleCardsSuccessState) {
            cardTableCubit.deckId = state.deckId;
            await cardTableCubit.fetchCard(
              deckId: cardTableCubit.deckId,
              count: "2",
            );
          }

          if (state is ReshuffleCardsSuccessState) {
            cardTableCubit.deckId = state.deckId;
            await cardTableCubit.fetchCard(
              deckId: cardTableCubit.deckId,
              count: "2",
            );
          }
        },
        builder: ((context, state) {
          return Scaffold(
              body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: state is DrawCardSuccessState
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 400.w,
                            height: 314.h,
                            child: Row(children: [
                              cardListCpu.length <= 2
                                  ? Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: cardListCpu.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Image.network(
                                            cardListCpu[index].image ?? '',
                                            fit: BoxFit.fill,
                                          );
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: Swiper(
                                        index: cardListCpu.indexOf(cardListCpu.last),
                                        controller: SwiperController(),
                                        itemBuilder: (BuildContext context, int index) {
                                          return Image.network(
                                            cardListCpu[index].image ?? '',
                                            fit: BoxFit.fill,
                                          );
                                        },
                                        itemCount: cardListCpu.length,
                                        itemWidth: 180.0.w,
                                        itemHeight: 314.h,
                                        layout: SwiperLayout.STACK,
                                      ),
                                    )
                            ]),
                          ),
                          Text(
                            "Pontuação CPU: $cpuScore",
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                          ),
                          Center(
                            child: SizedBox(
                              height: 100,
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  side: const BorderSide(color: Colors.amber, width: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                child: const Text(
                                  "COMPRAR",
                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                                ),
                                onPressed: () async {
                                  await cardTableCubit.fetchCard(
                                    deckId: cardTableCubit.deckId,
                                    count: "2",
                                  );
                                },
                              ),
                            ),
                          ),
                          Text(
                            "Pontuação Usuario: $userScore ",
                            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                          ),
                          SizedBox(
                            width: 400.w,
                            height: 314.h,
                            child: Row(children: [
                              cardListUser.length <= 2
                                  ? Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: cardListUser.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Image.network(
                                            cardListUser[index].image ?? '',
                                            fit: BoxFit.fill,
                                          );
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: Swiper(
                                        controller: SwiperController(),
                                        index: cardListUser.indexOf(cardListUser.last),
                                        itemBuilder: (BuildContext context, int index) {
                                          return Image.network(
                                            cardListUser[index].image ?? '',
                                            fit: BoxFit.fill,
                                          );
                                        },
                                        itemCount: cardListUser.length,
                                        itemWidth: 180.0.w,
                                        itemHeight: 314.h,
                                        layout: SwiperLayout.STACK,
                                      ),
                                    )
                            ]),
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
          ));
        }));
  }
}
