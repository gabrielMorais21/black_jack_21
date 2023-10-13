import 'package:black_jack_21/app/common/routes.dart';
import 'package:black_jack_21/app/modules/card_table/data/data.dart';

import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CardTableRemoteDatasourceImp implements CardTableRemoteDatasource {
  final Dio httpclient;

  CardTableRemoteDatasourceImp({required this.httpclient});
  @override
  Future<Either<CardTableFailure, Map<String, dynamic>>> getReshuffleCards(
      {required String deckId}) async {
    Response? response;
    try {
      var url = ApiRoutes.getReshuffleCards.replaceAll("<<deck_id>>", deckId);
      response = await httpclient.get(url);

      if (response.data['success'] == false) throw CardTableRequestError();

      return right(response.data);
    } on CardTableRequestError {
      return left(
          CardTableRequestError(message: response?.data['error'] ?? ""));
    }
  }

  @override
  Future<Either<CardTableFailure, Map<String, dynamic>>> getShuffleCards({
    required String deckCount,
  }) async {
    Response? response;
    try {
      var url = ApiRoutes.getShuffleCards.replaceAll("<<count>>", deckCount);
      response = await httpclient.get(url);

      if (response.data['success'] == false) throw CardTableRequestError();

      return right(response.data);
    } on CardTableRequestError {
      return left(
          CardTableRequestError(message: response?.data['error'] ?? ""));
    }
  }

  @override
  Future<Either<CardTableFailure, Map<String, dynamic>>> getDrawCard(
      {required String count, required String deckId}) async {
    Response? response;
    try {
      var url = ApiRoutes.postDrawCard.replaceAll("<<count>>", count);
      url = url.replaceAll("<<deck_id>>", deckId);
      response = await httpclient.get(url);

      if (response.data['success'] == false) throw CardTableRequestError();

      return right(response.data);
    } on CardTableRequestError {
      return left(
          CardTableRequestError(message: response?.data['error'] ?? ""));
    }
  }
}
