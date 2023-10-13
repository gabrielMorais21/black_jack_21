import 'dart:ui';

import 'package:black_jack_21/app/common/enums/game_results_enum.dart';
import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../../../../../../mock/mock.mocks.dart';

import 'package:black_jack_21/app/modules/card_table/domain/domain.dart';
import 'package:black_jack_21/app/modules/card_table/infra/infra.dart';
import 'package:black_jack_21/app/modules/card_table/presentation/presentation.dart';

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
    'Should validate Scaffold and its attributes',
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
    'Should validate backgroundContainer and its attributes',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(app);
        await tester.pumpAndSettle();

        var backgroundContainerFind =
            find.byKey(const Key("backgroundContainer"));
        expect(backgroundContainerFind, findsOneWidget);
        Container container = tester.firstWidget(backgroundContainerFind);

        expect(container.decoration, isA<BoxDecoration>());

        BoxDecoration boxDecoration = container.decoration as BoxDecoration;

        expect(boxDecoration.image, isA<DecorationImage>());

        DecorationImage decorationImage = boxDecoration.image!;

        expect(decorationImage.fit, BoxFit.cover);
        expect(
            decorationImage.image, const AssetImage('assets/background.jpg'));
      });
    },
  );

  testWidgets(
    'Should validate BackdropFilter and its attribute',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(app);
        await tester.pumpAndSettle();

        var backdropFilterFind = find.byType(BackdropFilter);
        expect(backdropFilterFind, findsOneWidget);
        BackdropFilter backdropFilter = tester.firstWidget(backdropFilterFind);

        expect(
            backdropFilter.filter, ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0));
      });
    },
  );

  testWidgets(
    'Should validate CardTableColumn and its attribute',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(app);
        await tester.pumpAndSettle();

        var columnFind = find.byKey(const Key("CardTableColumn"));
        expect(columnFind, findsOneWidget);
        Column column = tester.firstWidget(columnFind);

        expect(column.children[0], isA<CardHand>());
        expect(column.children[1], isA<ScoreLabel>());
        expect(column.children[2], isA<BuyCardButton>());
        expect(column.children[3], isA<ScoreLabel>());
        expect(column.children[4], isA<CardHand>());
      });
    },
  );
}
