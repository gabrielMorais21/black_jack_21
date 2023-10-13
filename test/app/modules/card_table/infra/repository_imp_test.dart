import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:black_jack_21/app/modules/card_table/data/data.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mock.mocks.dart';

// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;

void main() {
  final MockCardTableRemoteDatasource mockCardTableRemoteDatasource =
      MockCardTableRemoteDatasource();
  final CardTableMock cardTableMock = CardTableMock();

  setUpAll(() {
    injectionContainer.sl.registerSingleton<CardTableRemoteDatasource>(
        mockCardTableRemoteDatasource);
  });

  group("repository getShuffleCards", () {
    test("should return an object of type DeckModel", () async {
      when(mockCardTableRemoteDatasource.getShuffleCards(deckCount: "6"))
          .thenAnswer(
              (_) async => right(cardTableMock.shuffleTheCardsSuccess()));

      CardTableRepositoryImp cardTableRepositoryImp =
          CardTableRepositoryImp(datasource: injectionContainer.sl());
      final result =
          await cardTableRepositoryImp.getShuffleCards(deckCount: "6");

      expect(result.isRight(), true);
      result.fold((l) => null,
          (DeckModel deckModel) => expect(deckModel, isA<DeckModel>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var requestFail = cardTableMock.shuffleTheCardsFail();
      when(mockCardTableRemoteDatasource.getShuffleCards(deckCount: "6"))
          .thenAnswer((_) async =>
              left(CardTableRequestError(message: requestFail['error'] ?? "")));

      CardTableRepositoryImp cardTableRepositoryImp =
          CardTableRepositoryImp(datasource: injectionContainer.sl());
      final result =
          await cardTableRepositoryImp.getShuffleCards(deckCount: "6");

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "The max number of Decks is 20.");
      }, (r) => null);
    });
  });

  group("repository getReshuffleCards", () {
    test("should return an object of type DeckModel", () async {
      when(mockCardTableRemoteDatasource.getReshuffleCards(
              deckId: "3p40paa87x90"))
          .thenAnswer(
              (_) async => right(cardTableMock.shuffleTheCardsSuccess()));

      CardTableRepositoryImp cardTableRepositoryImp =
          CardTableRepositoryImp(datasource: injectionContainer.sl());
      final result = await cardTableRepositoryImp.getReshuffleCards(
          deckId: "3p40paa87x90");

      expect(result.isRight(), true);
      result.fold((l) => null,
          (DeckModel deckModel) => expect(deckModel, isA<DeckModel>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var requestFail = cardTableMock.reshuffleTheCardsFail();
      when(mockCardTableRemoteDatasource.getReshuffleCards(
              deckId: "3p40paa87x90"))
          .thenAnswer((_) async =>
              left(CardTableRequestError(message: requestFail['error'] ?? "")));

      CardTableRepositoryImp cardTableRepositoryImp =
          CardTableRepositoryImp(datasource: injectionContainer.sl());
      final result = await cardTableRepositoryImp.getReshuffleCards(
          deckId: "3p40paa87x90");

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "Deck ID does not exist.");
      }, (r) => null);
    });
  });

  group("repository getDrawCard", () {
    test("should return an object of type CardModel", () async {
      when(mockCardTableRemoteDatasource.getDrawCard(
              count: "2", deckId: "3p40paa87x90"))
          .thenAnswer((_) async => right(cardTableMock.drawCardSuccess()));

      CardTableRepositoryImp cardTableRepositoryImp =
          CardTableRepositoryImp(datasource: injectionContainer.sl());
      final result = await cardTableRepositoryImp.getDrawCard(
          deckId: "3p40paa87x90", count: "2");

      expect(result.isRight(), true);
      result.fold((l) => null,
          (CardModel cardModel) => expect(cardModel, isA<CardModel>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var requestFail = cardTableMock.drawCardFail();
      when(mockCardTableRemoteDatasource.getDrawCard(
              count: "2", deckId: "3p40paa87x90"))
          .thenAnswer((_) async =>
              left(CardTableRequestError(message: requestFail['error'] ?? "")));

      CardTableRepositoryImp cardTableRepositoryImp =
          CardTableRepositoryImp(datasource: injectionContainer.sl());
      final result = await cardTableRepositoryImp.getDrawCard(
          deckId: "3p40paa87x90", count: "2");

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "Deck ID does not exist.");
      }, (r) => null);
    });
  });
}
