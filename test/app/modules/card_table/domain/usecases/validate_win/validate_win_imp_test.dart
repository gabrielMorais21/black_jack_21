import 'package:black_jack_21/app/common/enums/game_results_enum.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/validate_win/validate_win.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/validate_win/validate_win_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should validate whether the match result was win", () async {
    ValidateWin validateWin = ValidateWinImp();
    final result = validateWin(userScore: 21, cpuScore: 12);

    expect(result, GameResults.win);
  });

  test("should validate whether the match result was loss", () async {
    ValidateWin validateWin = ValidateWinImp();
    final result = validateWin(userScore: 12, cpuScore: 21);

    expect(result, GameResults.loss);
  });

  test("should validate whether the match result was draw", () async {
    ValidateWin validateWin = ValidateWinImp();
    final result = validateWin(userScore: 21, cpuScore: 21);

    expect(result, GameResults.draw);
  });
}
