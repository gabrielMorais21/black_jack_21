import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/new_deck/new_deck.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/deck_model.dart';
import 'package:black_jack_21/app/modules/card_table/infra/repository.dart';
import 'package:dartz/dartz.dart';

class NewDeckImp implements NewDeck {
  final CardTableRepository repository;

  NewDeckImp({required this.repository});

  @override
  Future<Either<CardTableFailure, DeckModel>> call() async {
    return await repository.getNewDeck();
  }
}
