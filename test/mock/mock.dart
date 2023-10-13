import 'package:black_jack_21/app/modules/card_table/data/data.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
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
