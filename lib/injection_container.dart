import 'package:black_jack_21/app/modules/card_table/data/remote/remote_datasource.dart';
import 'package:black_jack_21/app/modules/card_table/data/remote/remote_datasource_imp.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/calculate_score/calculate_score.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/calculate_score/calculate_score_imp.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/draw_card/draw_card.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/draw_card/draw_card_imp.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/reshuffle_cards/reshuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/reshuffle_cards/reshuffle_cards_imp.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/shuffle_cards/shuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/shuffle_cards/shuffle_cards_imp.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/validate_win/validate_win.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/validate_win/validate_win_imp.dart';
import 'package:black_jack_21/app/modules/card_table/infra/repository.dart';
import 'package:black_jack_21/app/modules/card_table/infra/repository_imp.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_cubit.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_state.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // cubit
  sl.registerFactory(() => CardTableCubit(
        drawCard: sl(),
        reshuffleCards: sl(),
        shuffleCards: sl(),
        validateWin: sl(),
        calculateScore: sl(),
        initialState: CardTableInitialState(),
      ));

  // use cases
  sl.registerLazySingleton<DrawCard>(() => DrawCardImp(repository: sl()));
  sl.registerLazySingleton<ReshuffleCards>(() => ReshuffleCardsImp(repository: sl()));
  sl.registerLazySingleton<ShuffleCards>(() => ShuffleCardsImp(repository: sl()));
  sl.registerLazySingleton<ValidateWin>(() => ValidateWinImp());
  sl.registerLazySingleton<CalculateScore>(() => CalculateScoreImp());

  // repository
  sl.registerLazySingleton<CardTableRepository>(() => CardTableRepositoryImp(datasource: sl()));

  // Data source
  sl.registerLazySingleton<CardTableRemoteDatasource>(() => CardTableRemoteDatasourceImp(httpclient: sl()));

  //external
  sl.registerLazySingleton(() => Dio());
}
