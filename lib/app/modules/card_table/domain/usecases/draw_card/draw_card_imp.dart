import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/draw_card/draw_card.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:black_jack_21/app/modules/card_table/infra/repository.dart';
import 'package:dartz/dartz.dart';

class DrawCardImp implements DrawCard {
  final CardTableRepository repository;

  DrawCardImp({required this.repository});

  @override
  Future<Either<CardTableFailure, CardModel>> call({required String count, required String deckId}) async {
    return await repository.getDrawCard(count: count, deckId: deckId);
  }
}
