import 'package:black_jack_21/app/modules/card_table/data/remote/remote_datasource.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/calculate_score/calculate_score.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/draw_card/draw_card.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/reshuffle_cards/reshuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/shuffle_cards/shuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/validate_win/validate_win.dart';
import 'package:black_jack_21/app/modules/card_table/infra/repository.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_cubit.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  Dio,
  CardTableCubit,
  DrawCard,
  ReshuffleCards,
  ShuffleCards,
  ValidateWin,
  CalculateScore,
  CardTableRepository,
  CardTableRemoteDatasource,
])
void main() {}
