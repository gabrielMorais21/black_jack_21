import 'dart:ui';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/cubit.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/pages/card_table_page/card_table_mixin.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/widgets/widgets.dart';
// ignore: library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardTablePage extends StatefulWidget {
  final CardTableCubit cardTableCubit;
  const CardTablePage({super.key, required this.cardTableCubit});

  @override
  State<CardTablePage> createState() => _CardTablePageState();
}

class _CardTablePageState extends State<CardTablePage> with CardTableMixin {
  @override
  void initState() {
    widget.cardTableCubit.fetchShuffleCards(deckCount: "6");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardTableCubit, CardTableState>(
        bloc: widget.cardTableCubit,
        listener: (context, state) async {
          if (state is CardTableErrorState) {
            showErrorModal(
              context,
              text: state.failure.message ?? "",
            );
          }

          if (state is DrawCardSuccessState) {
            cardListUser.add(state.cardModel.cards![0]);
            cardListCpu.add(state.cardModel.cards![1]);
            userScore =
                widget.cardTableCubit.calculateScore(cards: cardListUser);
            cpuScore = widget.cardTableCubit.calculateScore(cards: cardListCpu);
            var result = widget.cardTableCubit
                .validateWin(cpuScore: cpuScore, userScore: userScore);

            if (result != null) {
              showResultModal(context, text: result.value, callback: () async {
                setState(() {
                  gameIsFinished = !gameIsFinished;
                });
              });
            }
          }

          if (state is ShuffleCardsSuccessState) {
            widget.cardTableCubit.deckId = state.deckId;
            await widget.cardTableCubit.fetchCard(
              deckId: widget.cardTableCubit.deckId,
              count: "2",
            );
          }

          if (state is ReshuffleCardsSuccessState) {
            widget.cardTableCubit.deckId = state.deckId;
            await widget.cardTableCubit.fetchCard(
              deckId: widget.cardTableCubit.deckId,
              count: "2",
            );
          }
        },
        builder: ((context, state) {
          return Scaffold(
              body: Container(
            key: const Key("backgroundContainer"),
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
                        key: const Key("CardTableColumn"),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardHand(cardsList: cardListCpu),
                          ScoreLabel(score: cpuScore, scoreOwner: 'CPU'),
                          gameIsFinished
                              ? ReshuffleCardsButton(onPressed: () async {
                                  await widget.cardTableCubit
                                      .fetchReshuffleCards(
                                    deckId: widget.cardTableCubit.deckId,
                                  );
                                  cardListUser = [];
                                  cardListCpu = [];
                                  gameIsFinished = !gameIsFinished;
                                })
                              : BuyCardButton(onPressed: () async {
                                  await widget.cardTableCubit.fetchCard(
                                    deckId: widget.cardTableCubit.deckId,
                                    count: "2",
                                  );
                                }),
                          ScoreLabel(score: userScore, scoreOwner: 'Usuario'),
                          CardHand(cardsList: cardListUser)
                        ],
                      )
                    : Container(),
              ),
            ),
          ));
        }));
  }
}
