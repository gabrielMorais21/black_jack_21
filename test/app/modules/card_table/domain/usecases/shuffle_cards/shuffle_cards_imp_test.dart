import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../../../mock/mock.mocks.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;

void main() {
  final MockCardTableRepository mockCardTableRepository =
      MockCardTableRepository();
  final CardTableMock cardTableMock = CardTableMock();

  setUpAll(() {
    injectionContainer.sl
        .registerSingleton<CardTableRepository>(mockCardTableRepository);
  });

  group("usecase DrawCard", () {
    test("should return an object of type CardModel", () async {
      when(mockCardTableRepository.getShuffleCards(
        deckCount: "6",
      )).thenAnswer((_) async =>
          right(DeckModel.fromJson(cardTableMock.reshuffleTheCardsSuccess())));

      ShuffleCardsImp shuffleCardsImp =
          ShuffleCardsImp(repository: injectionContainer.sl());
      final result = await shuffleCardsImp(
        deckCount: "6",
      );

      expect(result.isRight(), true);
      result.fold((l) => null,
          (DeckModel deckModel) => expect(deckModel, isA<DeckModel>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var requestFail = cardTableMock.shuffleTheCardsFail();
      when(mockCardTableRepository.getShuffleCards(deckCount: "60")).thenAnswer(
          (_) async =>
              left(CardTableRequestError(message: requestFail['error'] ?? "")));

      ShuffleCardsImp shuffleCardsImp =
          ShuffleCardsImp(repository: injectionContainer.sl());
      final result = await shuffleCardsImp(
        deckCount: "60",
      );

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "The max number of Decks is 20.");
      }, (r) => null);
    });
  });
}
