import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:dartz/dartz.dart';

abstract class CardTableRemoteDatasource {
  Future<Either<CardTableFailure,  Map<String, dynamic>>> getShuffleCards({required String deckCount});
  Future<Either<CardTableFailure,  Map<String, dynamic>>> getReshuffleCards({required String deckId});
  Future<Either<CardTableFailure,  Map<String, dynamic>>> getDrawCard({required String count, required String deckId});
}
