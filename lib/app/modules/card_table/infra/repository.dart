import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';

abstract class CardTableRepository {
  Future<Either<CardTableFailure, DeckModel>> getShuffleCards(
      {required String deckCount});
  Future<Either<CardTableFailure, DeckModel>> getReshuffleCards(
      {required String deckId});
  Future<Either<CardTableFailure, CardModel>> getDrawCard(
      {required String count, required String deckId});
}
