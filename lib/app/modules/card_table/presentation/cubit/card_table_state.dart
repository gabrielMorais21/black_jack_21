import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:equatable/equatable.dart';

abstract class CardTableState extends Equatable {}

class CardTableInitialState extends CardTableState {
  @override
  List<Object> get props => [];
}

class CardTableLoadingState extends CardTableState {
  @override
  List<Object> get props => [];
}

class CardTableSuccessState extends CardTableState {
  CardTableSuccessState();

  @override
  List<Object> get props => [];
}

class DrawCardSuccessState extends CardTableState {
  final CardModel cardModel;

  DrawCardSuccessState({required this.cardModel});

  @override
  List<Object> get props => [cardModel];
}

class ReshuffleCardsSuccessState extends CardTableState {
  final String deckId;
  ReshuffleCardsSuccessState({required this.deckId});

  @override
  List<Object> get props => [deckId];
}

class ShuffleCardsSuccessState extends CardTableState {
  final String deckId;
  ShuffleCardsSuccessState({required this.deckId});

  @override
  List<Object> get props => [deckId];
}

class CardTableErrorState extends CardTableState {
  final CardTableFailure failure;

  CardTableErrorState(this.failure);

  @override
  List<Object> get props => [];
}
