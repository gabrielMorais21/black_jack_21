import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/draw_card/draw_card.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/new_deck/new_deck.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/reshuffle_cards/reshuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/shuffle_cards/shuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_state.dart';
import 'package:bloc/bloc.dart';

class CardTableCubit extends Cubit<CardTableState> {
  final DrawCard drawCard;
  final NewDeck newDeck;
  final ReshuffleCards reshuffleCards;
  final ShuffleCards shuffleCards;
  String deckId = "";

  CardTableCubit({
    required CardTableState initialState,
    required this.drawCard,
    required this.newDeck,
    required this.reshuffleCards,
    required this.shuffleCards,
  }) : super(initialState);

  void resetState() {
    emit(CardTableInitialState());
  }

  void emitSuccess() {
    emit(CardTableSuccessState());
  }

  Future<void> fetchCard({required String count, required String deckId, required bool isCpu}) async {
    try {
      emit(CardTableLoadingState());
      final result = await drawCard(count: count, deckId: deckId);
      result.fold((l) {
        emit(CardTableErrorState(l));
        return;
      }, (r) async {
        emit(DrawCardSuccessState(cardModel: r, isCpu: isCpu));
      });
    } catch (e) {
      emit(CardTableErrorState(CardTableUnkownError(message: e.toString())));
    }
  }

  Future<void> fetchReshuffleCards({required String deckId}) async {
    try {
      emit(CardTableLoadingState());
      final result = await reshuffleCards(deckId: deckId);
      result.fold((l) {
        emit(CardTableErrorState(l));
      }, (r) async {
        emit(ReshuffleCardsSuccessState(deckId: r.deckId ?? ""));
      });
    } catch (e) {
      emit(CardTableErrorState(CardTableUnkownError(message: e.toString())));
    }
  }

  Future<void> fetchShuffleCards({required String deckCount}) async {
    try {
      emit(CardTableLoadingState());
      final result = await shuffleCards(deckCount: deckCount);
      result.fold((l) {
        emit(CardTableErrorState(l));
      }, (r) async {
        emit(ShuffleCardsSuccessState(deckId: r.deckId ?? ""));
      });
    } catch (e) {
      emit(CardTableErrorState(CardTableUnkownError(message: e.toString())));
    }
  }
}
