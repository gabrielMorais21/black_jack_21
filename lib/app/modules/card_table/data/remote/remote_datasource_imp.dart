import 'package:black_jack_21/app/common/routes.dart';
import 'package:black_jack_21/app/modules/card_table/data/remote/remote_datasource.dart';
import 'package:black_jack_21/app/modules/card_table/domain/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

CardTableFailure getFailureError(Response? response) {
  if (response == null) return CardTableUnkownError();
  switch (response.statusCode) {
    case 400:
      return CardTableRequestError(message: response.statusMessage, data: response.data);
    case 401:
      return CardTableUnauthorizedError(message: response.statusMessage, data: response.data);
    case 403:
      return CardTableForbiddenError(message: response.statusMessage, data: response.data);
    case 404:
      return CardTableRequestError(message: response.statusMessage, data: response.data);
    case 408:
      return CardTableRequestError(message: response.statusMessage, data: response.data);
    case 500:
      return CardTableInternalError(message: response.statusMessage, data: response.data);
    default:
      if (response.statusMessage == null || response.statusMessage!.toUpperCase() == "OK") response.statusMessage = "Ops, ocorreu um erro";
      return CardTableUnkownError(message: response.statusMessage, code: response.statusCode.toString(), data: response.data);
  }
}

class CardTableRemoteDatasourceImp implements CardTableRemoteDatasource {
  final Dio httpclient;

  CardTableRemoteDatasourceImp({required this.httpclient});

  @override
  Future<Either<CardTableFailure, Map<String, dynamic>>> getNewDeck() async {
    Response? response;
    try {
      response = await httpclient.get(ApiRoutes.getNewDeck);

      if (response.statusCode != 200 || response.data == null) throw CardTableRequestError();

      return right(response.data);
    } on CardTableRequestError {
      CardTableFailure failure = getFailureError(response);

      return left(failure);
    }
  }

  @override
  Future<Either<CardTableFailure, Map<String, dynamic>>> getReshuffleCards({required String deckId}) async {
    Response? response;
    try {
      var url = ApiRoutes.getReshuffleCards.replaceAll("<<deck_id>>", deckId);
      response = await httpclient.get(url);

      if (response.statusCode != 200 || response.data == null) throw CardTableRequestError();

      return right(response.data);
    } on CardTableRequestError {
      CardTableFailure failure = getFailureError(response);

      return left(failure);
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

      if (response.statusCode != 200 || response.data == null) throw CardTableRequestError();

      return right(response.data);
    } on CardTableRequestError {
      CardTableFailure failure = getFailureError(response);

      return left(failure);
    }
  }

  @override
  Future<Either<CardTableFailure, Map<String, dynamic>>> postDrawCard({required String count, required String deckId}) async {
    Response? response;
    try {
      var url = ApiRoutes.postDrawCard.replaceAll("<<count>>", count);
      url = url.replaceAll("<<deck_id>>", deckId);
      response = await httpclient.get(url);

      if (response.statusCode != 200 || response.data == null) throw CardTableRequestError();

      return right(response.data);
    } on CardTableRequestError {
      CardTableFailure failure = getFailureError(response);

      return left(failure);
    }
  }
}
