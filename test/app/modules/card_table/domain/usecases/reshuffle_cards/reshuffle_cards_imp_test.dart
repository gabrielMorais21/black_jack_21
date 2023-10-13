import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:dartz/dartz.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
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

  group("usecase ReshuffleCards", () {
    test("should return an object of type DeckModel", () async {
      when(mockCardTableRepository.getReshuffleCards(
        deckId: "3p40paa87x90",
      )).thenAnswer((_) async =>
          right(DeckModel.fromJson(cardTableMock.reshuffleTheCardsSuccess())));

      ReshuffleCardsImp reshuffleCardsImp =
          ReshuffleCardsImp(repository: injectionContainer.sl());
      final result = await reshuffleCardsImp(
        deckId: "3p40paa87x90",
      );

      expect(result.isRight(), true);
      result.fold((l) => null,
          (DeckModel deckModel) => expect(deckModel, isA<DeckModel>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var requestFail = cardTableMock.reshuffleTheCardsFail();
      when(mockCardTableRepository.getReshuffleCards(
        deckId: "3p40paa87x90",
      )).thenAnswer((_) async =>
          left(CardTableRequestError(message: requestFail['error'] ?? "")));

      ReshuffleCardsImp reshuffleCardsImp =
          ReshuffleCardsImp(repository: injectionContainer.sl());
      final result = await reshuffleCardsImp(
        deckId: "3p40paa87x90",
      );

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "Deck ID does not exist.");
      }, (r) => null);
    });
  });
}
