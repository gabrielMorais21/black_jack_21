import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';

import '../../../../../mock/mock.mocks.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;

void main() {
  MockDrawCard mockDrawCard = MockDrawCard();
  MockReshuffleCards mockReshuffleCards = MockReshuffleCards();
  MockShuffleCards mockShuffleCards = MockShuffleCards();
  MockValidateWin mockValidateWin = MockValidateWin();
  MockCalculateScore mockCalculateScore = MockCalculateScore();
  final CardTableMock cardTableMock = CardTableMock();

  setUpAll(() {
    injectionContainer.sl.registerSingleton<DrawCard>(mockDrawCard);
    injectionContainer.sl.registerSingleton<ReshuffleCards>(mockReshuffleCards);
    injectionContainer.sl.registerSingleton<ShuffleCards>(mockShuffleCards);
    injectionContainer.sl.registerSingleton<ValidateWin>(mockValidateWin);
    injectionContainer.sl.registerSingleton<CalculateScore>(mockCalculateScore);
  });

  blocTest(
    "should make a successful request and return the following states[CardTableLoadingState(), DrawCardSuccessState()]",
    setUp: () {
      when(mockDrawCard(count: "2", deckId: "3p40paa87x90")).thenAnswer(
          (_) async =>
              right(CardModel.fromJson(cardTableMock.drawCardSuccess())));
    },
    build: () => CardTableCubit(
      drawCard: injectionContainer.sl(),
      reshuffleCards: injectionContainer.sl(),
      shuffleCards: injectionContainer.sl(),
      validateWin: injectionContainer.sl(),
      calculateScore: injectionContainer.sl(),
      initialState: CardTableInitialState(),
    ),
    act: (cubit) => cubit.fetchCard(count: "2", deckId: "3p40paa87x90"),
    expect: () => [
      isA<CardTableLoadingState>(),
      isA<DrawCardSuccessState>(),
    ],
  );

  blocTest(
    "should make a successful request and return the following states[CardTableLoadingState(), ShuffleCardsSuccessState()]",
    setUp: () {
      when(mockShuffleCards(deckCount: "6")).thenAnswer((_) async =>
          right(DeckModel.fromJson(cardTableMock.shuffleTheCardsSuccess())));
    },
    build: () => CardTableCubit(
      drawCard: injectionContainer.sl(),
      reshuffleCards: injectionContainer.sl(),
      shuffleCards: injectionContainer.sl(),
      validateWin: injectionContainer.sl(),
      calculateScore: injectionContainer.sl(),
      initialState: CardTableInitialState(),
    ),
    act: (cubit) => cubit.fetchShuffleCards(deckCount: "6"),
    expect: () => [
      isA<CardTableLoadingState>(),
      isA<ShuffleCardsSuccessState>(),
    ],
  );

  blocTest(
    "should make a successful request and return the following states[CardTableLoadingState(), ReshuffleCardsSuccessState()]",
    setUp: () {
      when(mockReshuffleCards(deckId: "3p40paa87x90")).thenAnswer((_) async =>
          right(DeckModel.fromJson(cardTableMock.reshuffleTheCardsSuccess())));
    },
    build: () => CardTableCubit(
      drawCard: injectionContainer.sl(),
      reshuffleCards: injectionContainer.sl(),
      shuffleCards: injectionContainer.sl(),
      validateWin: injectionContainer.sl(),
      calculateScore: injectionContainer.sl(),
      initialState: CardTableInitialState(),
    ),
    act: (cubit) => cubit.fetchReshuffleCards(deckId: "3p40paa87x90"),
    expect: () => [
      isA<CardTableLoadingState>(),
      isA<ReshuffleCardsSuccessState>(),
    ],
  );
}
