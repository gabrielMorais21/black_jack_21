abstract class CardTableFailure implements Exception {
  String? get message;
  String? get code;
  get data;
}

class CardTableRequestError implements CardTableFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  CardTableRequestError({this.message, this.code, this.data});
}

class CardTableUnauthorizedError implements CardTableFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  CardTableUnauthorizedError({this.message, this.code, this.data});
}

class CardTableForbiddenError implements CardTableFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  CardTableForbiddenError({this.message, this.code, this.data});
}

class CardTableInternalError implements CardTableFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  CardTableInternalError({this.message, this.code, this.data});
}

class CardTableUnkownError implements CardTableFailure {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final dynamic data;
  CardTableUnkownError({this.message, this.code, this.data});
}
