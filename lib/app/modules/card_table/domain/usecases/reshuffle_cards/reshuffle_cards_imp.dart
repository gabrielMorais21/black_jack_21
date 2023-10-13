import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';

class ReshuffleCardsImp implements ReshuffleCards {
  final CardTableRepository repository;

  ReshuffleCardsImp({required this.repository});

  @override
  Future<Either<CardTableFailure, DeckModel>> call(
      {required String deckId}) async {
    return await repository.getReshuffleCards(deckId: deckId);
  }
}
