import 'package:black_jack_21/app/common/enums/game_results_enum.dart';

abstract class ValidateWin {
  GameResults? call({required int userScore, required int cpuScore});
}
