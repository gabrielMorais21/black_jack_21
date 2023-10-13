import 'package:black_jack_21/app/common/routes.dart';
import 'package:black_jack_21/app/core/mock/card_table_mock.dart';
import 'package:black_jack_21/app/modules/card_table/data/data.dart';

import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../../mock/mock.mocks.dart';
// ignore: library_prefixes
import 'package:black_jack_21/injection_container.dart' as injectionContainer;

void main() {
  final MockDio mockDio = MockDio();
  final CardTableMock cardTableMock = CardTableMock();

  setUpAll(() {
    injectionContainer.sl.registerSingleton<Dio>(mockDio);
  });

  group("datasource getShuffleCards", () {
    test("should return an Map", () async {
      var url = ApiRoutes.getShuffleCards.replaceAll("<<count>>", '6');
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: cardTableMock.shuffleTheCardsSuccess(),
          statusCode: 200));

      CardTableRemoteDatasourceImp cardTableRemoteDatasourceImp =
          CardTableRemoteDatasourceImp(httpclient: injectionContainer.sl());
      final result =
          await cardTableRemoteDatasourceImp.getShuffleCards(deckCount: "6");

      expect(result.isRight(), true);
      result.fold(
          (l) => null,
          (Map<String, dynamic> map) =>
              expect(map, isA<Map<String, dynamic>>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var url = ApiRoutes.getShuffleCards.replaceAll("<<count>>", '6');
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: cardTableMock.shuffleTheCardsFail(),
          statusCode: 200));

      CardTableRemoteDatasourceImp cardTableRemoteDatasourceImp =
          CardTableRemoteDatasourceImp(httpclient: injectionContainer.sl());
      final result =
          await cardTableRemoteDatasourceImp.getShuffleCards(deckCount: "6");
      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "The max number of Decks is 20.");
      }, (r) => null);
    });
  });

  group("datasource getReshuffleCards", () {
    test("should return an Map", () async {
      var url =
          ApiRoutes.getReshuffleCards.replaceAll("<<deck_id>>", "3p40paa87x90");
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: cardTableMock.reshuffleTheCardsSuccess(),
          statusCode: 200));

      CardTableRemoteDatasourceImp cardTableRemoteDatasourceImp =
          CardTableRemoteDatasourceImp(httpclient: injectionContainer.sl());
      final result = await cardTableRemoteDatasourceImp.getReshuffleCards(
          deckId: "3p40paa87x90");

      expect(result.isRight(), true);
      result.fold(
          (l) => null,
          (Map<String, dynamic> map) =>
              expect(map, isA<Map<String, dynamic>>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var url =
          ApiRoutes.getReshuffleCards.replaceAll("<<deck_id>>", "3p40paa87x90");
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: cardTableMock.reshuffleTheCardsFail(),
          statusCode: 200));

      CardTableRemoteDatasourceImp cardTableRemoteDatasourceImp =
          CardTableRemoteDatasourceImp(httpclient: injectionContainer.sl());
      final result = await cardTableRemoteDatasourceImp.getReshuffleCards(
          deckId: "3p40paa87x90");
      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "Deck ID does not exist.");
      }, (r) => null);
    });
  });

  group("datasource getDrawCard", () {
    test("should return an Map", () async {
      var url = ApiRoutes.postDrawCard.replaceAll("<<count>>", "2");
      url = url.replaceAll("<<deck_id>>", "3p40paa87x90");
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: cardTableMock.drawCardSuccess(),
          statusCode: 200));

      CardTableRemoteDatasourceImp cardTableRemoteDatasourceImp =
          CardTableRemoteDatasourceImp(httpclient: injectionContainer.sl());
      final result = await cardTableRemoteDatasourceImp.getDrawCard(
          deckId: "3p40paa87x90", count: "2");

      expect(result.isRight(), true);
      result.fold(
          (l) => null,
          (Map<String, dynamic> map) =>
              expect(map, isA<Map<String, dynamic>>()));
    });

    test("should return an object of type CardTableRequestError", () async {
      var url = ApiRoutes.postDrawCard.replaceAll("<<count>>", "2");
      url = url.replaceAll("<<deck_id>>", "3p40paa87x90");
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: cardTableMock.drawCardFail(),
          statusCode: 200));

      CardTableRemoteDatasourceImp cardTableRemoteDatasourceImp =
          CardTableRemoteDatasourceImp(httpclient: injectionContainer.sl());
      final result = await cardTableRemoteDatasourceImp.getDrawCard(
          deckId: "3p40paa87x90", count: "2");
      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<CardTableRequestError>());
        expect(l.message, "Deck ID does not exist.");
      }, (r) => null);
    });
  });
}
