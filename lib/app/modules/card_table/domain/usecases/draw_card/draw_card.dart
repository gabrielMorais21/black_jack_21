import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';

import 'package:dartz/dartz.dart';

abstract class DrawCard {
  Future<Either<CardTableFailure, CardModel>> call(
      {required String count, required String deckId});
}
