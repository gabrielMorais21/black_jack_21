import 'package:black_jack_21/app/common/helpers/verify_double.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';

class CalculateScoreImp implements CalculateScore {
  @override
  int call({required List<Cards> cards}) {
    var ponto = 0;
    for (var card in cards) {
      if (card.value == "ACE") {
        ponto = ponto + 10;
      } else if (isDouble(card.value ?? '')) {
        ponto = ponto + int.parse(card.value ?? '');
      } else {
        ponto = ponto + 11;
      }
    }
    return ponto;
  }
}
