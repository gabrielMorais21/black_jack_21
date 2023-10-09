import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/shuffle_cards/shuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/deck_model.dart';
import 'package:black_jack_21/app/modules/card_table/infra/repository.dart';
import 'package:dartz/dartz.dart';

class ShuffleCardsImp implements ShuffleCards {
  final CardTableRepository repository;

  ShuffleCardsImp({required this.repository});

  @override
  Future<Either<CardTableFailure, DeckModel>> call({required String deckCount}) async {
    return await repository.getShuffleCards(deckCount: deckCount);
  }
}
