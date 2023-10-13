import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/usecases.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final CardTableMock cardTableMock = CardTableMock();
  test("should validate whether the match result was win", () async {
    CalculateScoreImp calculateScoreImp = CalculateScoreImp();
    CardModel cardModel = CardModel.fromJson(cardTableMock.drawCardSuccess());
    final result = calculateScoreImp(cards: cardModel.cards ?? []);

    expect(result, 11);
  });
}
