import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';

class DrawCardImp implements DrawCard {
  final CardTableRepository repository;

  DrawCardImp({required this.repository});

  @override
  Future<Either<CardTableFailure, CardModel>> call(
      {required String count, required String deckId}) async {
    return await repository.getDrawCard(count: count, deckId: deckId);
  }
}
