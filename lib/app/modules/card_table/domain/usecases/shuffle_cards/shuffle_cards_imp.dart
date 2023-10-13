import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:dartz/dartz.dart';

class ShuffleCardsImp implements ShuffleCards {
  final CardTableRepository repository;

  ShuffleCardsImp({required this.repository});

  @override
  Future<Either<CardTableFailure, DeckModel>> call(
      {required String deckCount}) async {
    return await repository.getShuffleCards(deckCount: deckCount);
  }
}
