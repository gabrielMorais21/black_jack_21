import 'dart:ui';
import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_cubit.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_state.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/widgets/buy_card_button.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/widgets/card_hand.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/widgets/reshuffle_cards_button.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/widgets/score_label.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/widgets/show_result_modal.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  bool gameIsFinished = false;

  @override
  void initState() {
    cardTableCubit.fetchShuffleCards(deckCount: "6");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardTableCubit, CardTableState>(
        bloc: cardTableCubit,
        listener: (context, state) async {
          if (state is DrawCardSuccessState) {
            cardListUser.add(state.cardModel.cards![0]);
            cardListCpu.add(state.cardModel.cards![1]);
            userScore = cardTableCubit.calculateScore(cardListUser);
            cpuScore = cardTableCubit.calculateScore(cardListCpu);
            var result = cardTableCubit.validateWin(cpuScore: cpuScore, userScore: userScore);
            if (result != null) {
              showResultModal(context, text: result.value, callback: () async {
                setState(() {
                  gameIsFinished = !gameIsFinished;
                });
              });
            }
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
                          CardHand(cardsList: cardListCpu),
                          ScoreLabel(score: cpuScore, scoreOwner: 'CPU'),
                          gameIsFinished
                              ? ReshuffleCardsButton(onPressed: () async {
                                  await cardTableCubit.fetchReshuffleCards(
                                    deckId: cardTableCubit.deckId,
                                  );
                                  cardListUser = [];
                                  cardListCpu = [];
                                  gameIsFinished = !gameIsFinished;
                                })
                              : BuyCardButton(onPressed: () async {
                                  await cardTableCubit.fetchCard(
                                    deckId: cardTableCubit.deckId,
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
