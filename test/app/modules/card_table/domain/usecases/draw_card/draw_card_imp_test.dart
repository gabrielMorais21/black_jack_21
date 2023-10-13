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
      when(mockCardTableRepository.getDrawCard(
              deckId: "3p40paa87x90", count: "2"))
          .thenAnswer((_) async =>
              right(CardModel.fromJson(cardTableMock.drawCardSuccess())));

      DrawCardImp drawCardImp =
          DrawCardImp(repository: injectionContainer.sl());
      final result = await drawCardImp(deckId: "3p40paa87x90", count: "2");

      expect(result.isRight(), true);
      result.fold((l) => null,
          (CardModel deckModel) => expect(deckModel, isA<CardModel>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var requestFail = cardTableMock.drawCardFail();
      when(mockCardTableRepository.getDrawCard(
              deckId: "3p40paa87x90", count: "2"))
          .thenAnswer((_) async =>
              left(CardTableRequestError(message: requestFail['error'] ?? "")));

      DrawCardImp drawCardImp =
          DrawCardImp(repository: injectionContainer.sl());
      final result = await drawCardImp(deckId: "3p40paa87x90", count: "2");

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "Deck ID does not exist.");
      }, (r) => null);
    });
  });
}
