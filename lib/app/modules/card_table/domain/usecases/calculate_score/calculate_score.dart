import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';

abstract class CalculateScore {
  int call({required List<Cards> cards});
}
