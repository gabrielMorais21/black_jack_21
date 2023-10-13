import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';

mixin CardTableMixin {
  List<Cards> cardListCpu = [];
  List<Cards> cardListUser = [];

  int cpuScore = 0;
  int userScore = 0;

  bool gameIsFinished = false;
}
