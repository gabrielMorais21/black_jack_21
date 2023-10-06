import 'dart:ui';

import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_cubit.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_state.dart';
import 'package:black_jack_21/injection_container.dart' as injectionContainer;
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CardTablePage extends StatefulWidget {
  const CardTablePage({super.key});

  @override
  State<CardTablePage> createState() => _CardTablePageState();
}

class _CardTablePageState extends State<CardTablePage> {
  CardTableCubit cardTableCubit = injectionContainer.sl.get<CardTableCubit>();
  CardModel? cardModel;

  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    await cardTableCubit.fetchNewDeck();
    await cardTableCubit.fetchCard(deckId: cardTableCubit.deckId, count: "5");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardTableCubit, CardTableState>(
        bloc: cardTableCubit,
        listener: (context, state) {
          if (state is DrawCardSuccessState) {
            print(state.cardModel.cards!.length);
            print(state);
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
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: state is DrawCardSuccessState
                    ? Center(
                      child: Container(
                        width: 700,
                        child: Row(
                          children: [
                            Flexible(
                              child: Swiper(
                                controller: SwiperController(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.network(
                                    state.cardModel.cards?[index].image ?? '',
                                    fit: BoxFit.fill,
                                  );
                                },
                                itemCount: state.cardModel.cards!.length,
                                itemWidth: 226.0,
                                itemHeight: 314,
                                // viewportFraction: 0.8,
                                // scale: 0.1,
                                layout: SwiperLayout.STACK,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
              ),
            ),
          ));
        }));
  }
}
