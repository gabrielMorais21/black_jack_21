import 'package:black_jack_21/app/common/enums/game_results_enum.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';

class ValidateWinImp implements ValidateWin {
  @override
  GameResults? call({required int userScore, required int cpuScore}) {
    if (userScore > 21 && cpuScore > 21) {
      return GameResults.draw;
    } else if (userScore == 21 && cpuScore == 21) {
      return GameResults.draw;
    } else if (cpuScore > 21) {
      return GameResults.win;
    } else if (cpuScore == 21) {
      return GameResults.loss;
    } else if (userScore > 21) {
      return GameResults.loss;
    } else if (userScore == 21) {
      return GameResults.win;
    } else {
      return null;
    }
  }
}
