import 'package:black_jack_21/app/modules/card_table/data/data.dart';
import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';

class CardTableRepositoryImp implements CardTableRepository {
  final CardTableRemoteDatasource datasource;

  CardTableRepositoryImp({required this.datasource});
  @override
  Future<Either<CardTableFailure, DeckModel>> getReshuffleCards(
      {required String deckId}) async {
    final result = await datasource.getReshuffleCards(deckId: deckId);
    return result.fold((l) {
      return left(l);
    }, (r) {
      return right(DeckModel.fromJson(r));
    });
  }

  @override
  Future<Either<CardTableFailure, DeckModel>> getShuffleCards(
      {required String deckCount}) async {
    final result = await datasource.getShuffleCards(deckCount: deckCount);
    return result.fold((l) {
      return left(l);
    }, (r) {
      return right(DeckModel.fromJson(r));
    });
  }

  @override
  Future<Either<CardTableFailure, CardModel>> getDrawCard(
      {required String count, required String deckId}) async {
    final result = await datasource.getDrawCard(count: count, deckId: deckId);
    return result.fold((l) {
      return left(l);
    }, (r) {
      return right(CardModel.fromJson(r));
    });
  }
}
