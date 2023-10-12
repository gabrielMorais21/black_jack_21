import 'package:black_jack_21/app/common/enums/game_results_enum.dart';
import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/calculate_score/calculate_score.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/draw_card/draw_card.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/reshuffle_cards/reshuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/shuffle_cards/shuffle_cards.dart';
import 'package:black_jack_21/app/modules/card_table/domain/usecases/validate_win/validate_win.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:black_jack_21/app/modules/card_table/infra/models/deck_model.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_cubit.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_state.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/pages/card_table_page/card_table_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../../../../../../mock/mock.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final CardTableMock cardTableMock = CardTableMock();
  MockShuffleCards mockShuffleCards = MockShuffleCards();
  MockDrawCard mockDrawCard = MockDrawCard();
  MockReshuffleCards mockReshuffleCards = MockReshuffleCards();
  MockValidateWin mockValidateWin = MockValidateWin();
  MockCalculateScore mockCalculateScore = MockCalculateScore();
  List<Cards> cardListCpu = [];
  List<Cards> cardListUser = [];

  final Widget app = ScreenUtilInit(
      designSize: const Size(1920, 1200),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: CardTablePage(cardTableCubit: injectionContainer.sl()),
        );
      });

  setUpAll(() async {
    when(mockDrawCard(count: "2", deckId: "3p40paa87x90")).thenAnswer(
        (_) async =>
            right(CardModel.fromJson(cardTableMock.drawCardSuccess())));

    when(mockShuffleCards(deckCount: "6")).thenAnswer((_) async =>
        right(DeckModel.fromJson(cardTableMock.shuffleTheCardsSuccess())));

    CardModel cardModel = CardModel.fromJson(cardTableMock.drawCardSuccess());

    cardListUser.add(cardModel.cards![0]);
    cardListCpu.add(cardModel.cards![1]);

    when(mockCalculateScore.call(cards: cardListUser)).thenAnswer((_) => 5);

    when(mockCalculateScore.call(cards: cardListCpu)).thenAnswer((_) => 5);

    when(mockValidateWin(cpuScore: 5, userScore: 5))
        .thenAnswer((_) => GameResults.draw);

    injectionContainer.sl.registerSingleton<DrawCard>(mockDrawCard);
    injectionContainer.sl.registerSingleton<ReshuffleCards>(mockReshuffleCards);
    injectionContainer.sl.registerSingleton<ShuffleCards>(mockShuffleCards);
    injectionContainer.sl.registerSingleton<ValidateWin>(mockValidateWin);
    injectionContainer.sl.registerSingleton<CalculateScore>(mockCalculateScore);

    injectionContainer.sl.registerFactory(() => CardTableCubit(
          drawCard: injectionContainer.sl(),
          reshuffleCards: injectionContainer.sl(),
          shuffleCards: injectionContainer.sl(),
          validateWin: injectionContainer.sl(),
          calculateScore: injectionContainer.sl(),
          initialState: CardTableInitialState(),
        ));
  });

  testWidgets(
    'Scaffold',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(app);
        await tester.pumpAndSettle();

        var scaffoldFind = find.byType(Scaffold);
        expect(scaffoldFind, findsOneWidget);
        Scaffold scaffold = tester.firstWidget(scaffoldFind);

        expect(scaffold.body, isA<Container>());
      });
    },
  );

  testWidgets(
    'Scaffold',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(app);
        await tester.pumpAndSettle();

        var backgroundContainerFind =
            find.byKey(const Key("backgroundContainer"));
        expect(backgroundContainerFind, findsOneWidget);
        Container container = tester.firstWidget(backgroundContainerFind);

        // expect(container.body, isA<Container>());
      });
    },
  );
}
