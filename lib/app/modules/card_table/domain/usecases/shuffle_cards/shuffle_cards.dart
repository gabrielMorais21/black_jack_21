import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/deck_model.dart';
import 'package:dartz/dartz.dart';

abstract class ShuffleCards {
  Future<Either<CardTableFailure, DeckModel>> call({required String deckCount});
}