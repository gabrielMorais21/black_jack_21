import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';

abstract class ReshuffleCards {
  Future<Either<CardTableFailure, DeckModel>> call({required String deckId});
}
