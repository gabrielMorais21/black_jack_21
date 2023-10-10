// Mocks generated by Mockito 5.4.2 from annotations
// in black_jack_21/test/mock/mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i13;

import 'package:black_jack_21/app/modules/card_table/data/remote/remote_datasource.dart'
    as _i21;
import 'package:black_jack_21/app/modules/card_table/domain/errors.dart'
    as _i17;
import 'package:black_jack_21/app/modules/card_table/domain/usecases/draw_card/draw_card.dart'
    as _i7;
import 'package:black_jack_21/app/modules/card_table/domain/usecases/reshuffle_cards/reshuffle_cards.dart'
    as _i8;
import 'package:black_jack_21/app/modules/card_table/domain/usecases/shuffle_cards/shuffle_cards.dart'
    as _i9;
import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart'
    as _i18;
import 'package:black_jack_21/app/modules/card_table/infra/models/deck_model.dart'
    as _i19;
import 'package:black_jack_21/app/modules/card_table/infra/repository.dart'
    as _i20;
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_cubit.dart'
    as _i15;
import 'package:black_jack_21/app/modules/card_table/presentation/cubit/card_table_state.dart'
    as _i10;
import 'package:bloc/bloc.dart' as _i16;
import 'package:dartz/dartz.dart' as _i11;
import 'package:dio/src/adapter.dart' as _i3;
import 'package:dio/src/cancel_token.dart' as _i14;
import 'package:dio/src/dio.dart' as _i12;
import 'package:dio/src/dio_mixin.dart' as _i5;
import 'package:dio/src/options.dart' as _i2;
import 'package:dio/src/response.dart' as _i6;
import 'package:dio/src/transformer.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBaseOptions_0 extends _i1.SmartFake implements _i2.BaseOptions {
  _FakeBaseOptions_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpClientAdapter_1 extends _i1.SmartFake
    implements _i3.HttpClientAdapter {
  _FakeHttpClientAdapter_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTransformer_2 extends _i1.SmartFake implements _i4.Transformer {
  _FakeTransformer_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInterceptors_3 extends _i1.SmartFake implements _i5.Interceptors {
  _FakeInterceptors_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4<T1> extends _i1.SmartFake implements _i6.Response<T1> {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDrawCard_5 extends _i1.SmartFake implements _i7.DrawCard {
  _FakeDrawCard_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReshuffleCards_6 extends _i1.SmartFake
    implements _i8.ReshuffleCards {
  _FakeReshuffleCards_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeShuffleCards_7 extends _i1.SmartFake implements _i9.ShuffleCards {
  _FakeShuffleCards_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCardTableState_8 extends _i1.SmartFake
    implements _i10.CardTableState {
  _FakeCardTableState_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_9<L, R> extends _i1.SmartFake implements _i11.Either<L, R> {
  _FakeEither_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i12.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BaseOptions get options => (super.noSuchMethod(
        Invocation.getter(#options),
        returnValue: _FakeBaseOptions_0(
          this,
          Invocation.getter(#options),
        ),
      ) as _i2.BaseOptions);

  @override
  set options(_i2.BaseOptions? _options) => super.noSuchMethod(
        Invocation.setter(
          #options,
          _options,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.HttpClientAdapter get httpClientAdapter => (super.noSuchMethod(
        Invocation.getter(#httpClientAdapter),
        returnValue: _FakeHttpClientAdapter_1(
          this,
          Invocation.getter(#httpClientAdapter),
        ),
      ) as _i3.HttpClientAdapter);

  @override
  set httpClientAdapter(_i3.HttpClientAdapter? _httpClientAdapter) =>
      super.noSuchMethod(
        Invocation.setter(
          #httpClientAdapter,
          _httpClientAdapter,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Transformer get transformer => (super.noSuchMethod(
        Invocation.getter(#transformer),
        returnValue: _FakeTransformer_2(
          this,
          Invocation.getter(#transformer),
        ),
      ) as _i4.Transformer);

  @override
  set transformer(_i4.Transformer? _transformer) => super.noSuchMethod(
        Invocation.setter(
          #transformer,
          _transformer,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Interceptors get interceptors => (super.noSuchMethod(
        Invocation.getter(#interceptors),
        returnValue: _FakeInterceptors_3(
          this,
          Invocation.getter(#interceptors),
        ),
      ) as _i5.Interceptors);

  @override
  void close({bool? force = false}) => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
          {#force: force},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<_i6.Response<T>> head<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #head,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> headUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #headUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #headUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> get<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #get,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> getUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #getUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> post<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #post,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> postUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #postUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> put<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #put,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> putUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #putUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> patch<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #patch,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> patchUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #patchUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> delete<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #delete,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> deleteUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i14.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #deleteUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<dynamic>> download(
    String? urlPath,
    dynamic savePath, {
    _i2.ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    _i14.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    Object? data,
    _i2.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #download,
          [
            urlPath,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i13.Future<_i6.Response<dynamic>>.value(_FakeResponse_4<dynamic>(
          this,
          Invocation.method(
            #download,
            [
              urlPath,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<dynamic>>);

  @override
  _i13.Future<_i6.Response<dynamic>> downloadUri(
    Uri? uri,
    dynamic savePath, {
    _i2.ProgressCallback? onReceiveProgress,
    _i14.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    Object? data,
    _i2.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadUri,
          [
            uri,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i13.Future<_i6.Response<dynamic>>.value(_FakeResponse_4<dynamic>(
          this,
          Invocation.method(
            #downloadUri,
            [
              uri,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<dynamic>>);

  @override
  _i13.Future<_i6.Response<T>> request<T>(
    String? url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i14.CancelToken? cancelToken,
    _i2.Options? options,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [url],
          {
            #data: data,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #request,
            [url],
            {
              #data: data,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> requestUri<T>(
    Uri? uri, {
    Object? data,
    _i14.CancelToken? cancelToken,
    _i2.Options? options,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestUri,
          [uri],
          {
            #data: data,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #requestUri,
            [uri],
            {
              #data: data,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);

  @override
  _i13.Future<_i6.Response<T>> fetch<T>(_i2.RequestOptions? requestOptions) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [requestOptions],
        ),
        returnValue: _i13.Future<_i6.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #fetch,
            [requestOptions],
          ),
        )),
      ) as _i13.Future<_i6.Response<T>>);
}

/// A class which mocks [CardTableCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockCardTableCubit extends _i1.Mock implements _i15.CardTableCubit {
  MockCardTableCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.DrawCard get drawCard => (super.noSuchMethod(
        Invocation.getter(#drawCard),
        returnValue: _FakeDrawCard_5(
          this,
          Invocation.getter(#drawCard),
        ),
      ) as _i7.DrawCard);

  @override
  _i8.ReshuffleCards get reshuffleCards => (super.noSuchMethod(
        Invocation.getter(#reshuffleCards),
        returnValue: _FakeReshuffleCards_6(
          this,
          Invocation.getter(#reshuffleCards),
        ),
      ) as _i8.ReshuffleCards);

  @override
  _i9.ShuffleCards get shuffleCards => (super.noSuchMethod(
        Invocation.getter(#shuffleCards),
        returnValue: _FakeShuffleCards_7(
          this,
          Invocation.getter(#shuffleCards),
        ),
      ) as _i9.ShuffleCards);

  @override
  String get deckId => (super.noSuchMethod(
        Invocation.getter(#deckId),
        returnValue: '',
      ) as String);

  @override
  set deckId(String? _deckId) => super.noSuchMethod(
        Invocation.setter(
          #deckId,
          _deckId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.CardTableState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeCardTableState_8(
          this,
          Invocation.getter(#state),
        ),
      ) as _i10.CardTableState);

  @override
  _i13.Stream<_i10.CardTableState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i13.Stream<_i10.CardTableState>.empty(),
      ) as _i13.Stream<_i10.CardTableState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void resetState() => super.noSuchMethod(
        Invocation.method(
          #resetState,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emitSuccess() => super.noSuchMethod(
        Invocation.method(
          #emitSuccess,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<void> fetchCard({
    required String? count,
    required String? deckId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchCard,
          [],
          {
            #count: count,
            #deckId: deckId,
          },
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  _i13.Future<void> fetchReshuffleCards({required String? deckId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchReshuffleCards,
          [],
          {#deckId: deckId},
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  _i13.Future<void> fetchShuffleCards({required String? deckCount}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchShuffleCards,
          [],
          {#deckCount: deckCount},
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  void emit(_i10.CardTableState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i16.Change<_i10.CardTableState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);
}

/// A class which mocks [DrawCard].
///
/// See the documentation for Mockito's code generation for more information.
class MockDrawCard extends _i1.Mock implements _i7.DrawCard {
  MockDrawCard() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, _i18.CardModel>> call({
    required String? count,
    required String? deckId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #count: count,
            #deckId: deckId,
          },
        ),
        returnValue: _i13
            .Future<_i11.Either<_i17.CardTableFailure, _i18.CardModel>>.value(
            _FakeEither_9<_i17.CardTableFailure, _i18.CardModel>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #count: count,
              #deckId: deckId,
            },
          ),
        )),
      ) as _i13.Future<_i11.Either<_i17.CardTableFailure, _i18.CardModel>>);
}

/// A class which mocks [ReshuffleCards].
///
/// See the documentation for Mockito's code generation for more information.
class MockReshuffleCards extends _i1.Mock implements _i8.ReshuffleCards {
  MockReshuffleCards() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>> call(
          {required String? deckId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#deckId: deckId},
        ),
        returnValue: _i13
            .Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>.value(
            _FakeEither_9<_i17.CardTableFailure, _i19.DeckModel>(
          this,
          Invocation.method(
            #call,
            [],
            {#deckId: deckId},
          ),
        )),
      ) as _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>);
}

/// A class which mocks [ShuffleCards].
///
/// See the documentation for Mockito's code generation for more information.
class MockShuffleCards extends _i1.Mock implements _i9.ShuffleCards {
  MockShuffleCards() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>> call(
          {required String? deckCount}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#deckCount: deckCount},
        ),
        returnValue: _i13
            .Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>.value(
            _FakeEither_9<_i17.CardTableFailure, _i19.DeckModel>(
          this,
          Invocation.method(
            #call,
            [],
            {#deckCount: deckCount},
          ),
        )),
      ) as _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>);
}

/// A class which mocks [CardTableRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCardTableRepository extends _i1.Mock
    implements _i20.CardTableRepository {
  MockCardTableRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>
      getShuffleCards({required String? deckCount}) => (super.noSuchMethod(
            Invocation.method(
              #getShuffleCards,
              [],
              {#deckCount: deckCount},
            ),
            returnValue: _i13.Future<
                    _i11.Either<_i17.CardTableFailure, _i19.DeckModel>>.value(
                _FakeEither_9<_i17.CardTableFailure, _i19.DeckModel>(
              this,
              Invocation.method(
                #getShuffleCards,
                [],
                {#deckCount: deckCount},
              ),
            )),
          ) as _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>);

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>
      getReshuffleCards({required String? deckId}) => (super.noSuchMethod(
            Invocation.method(
              #getReshuffleCards,
              [],
              {#deckId: deckId},
            ),
            returnValue: _i13.Future<
                    _i11.Either<_i17.CardTableFailure, _i19.DeckModel>>.value(
                _FakeEither_9<_i17.CardTableFailure, _i19.DeckModel>(
              this,
              Invocation.method(
                #getReshuffleCards,
                [],
                {#deckId: deckId},
              ),
            )),
          ) as _i13.Future<_i11.Either<_i17.CardTableFailure, _i19.DeckModel>>);

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, _i18.CardModel>> getDrawCard({
    required String? count,
    required String? deckId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDrawCard,
          [],
          {
            #count: count,
            #deckId: deckId,
          },
        ),
        returnValue: _i13
            .Future<_i11.Either<_i17.CardTableFailure, _i18.CardModel>>.value(
            _FakeEither_9<_i17.CardTableFailure, _i18.CardModel>(
          this,
          Invocation.method(
            #getDrawCard,
            [],
            {
              #count: count,
              #deckId: deckId,
            },
          ),
        )),
      ) as _i13.Future<_i11.Either<_i17.CardTableFailure, _i18.CardModel>>);
}

/// A class which mocks [CardTableRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCardTableRemoteDatasource extends _i1.Mock
    implements _i21.CardTableRemoteDatasource {
  MockCardTableRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, Map<String, dynamic>>>
      getShuffleCards({required String? deckCount}) => (super.noSuchMethod(
            Invocation.method(
              #getShuffleCards,
              [],
              {#deckCount: deckCount},
            ),
            returnValue: _i13.Future<
                    _i11
                    .Either<_i17.CardTableFailure, Map<String, dynamic>>>.value(
                _FakeEither_9<_i17.CardTableFailure, Map<String, dynamic>>(
              this,
              Invocation.method(
                #getShuffleCards,
                [],
                {#deckCount: deckCount},
              ),
            )),
          ) as _i13.Future<
              _i11.Either<_i17.CardTableFailure, Map<String, dynamic>>>);

  @override
  _i13.Future<_i11.Either<_i17.CardTableFailure, Map<String, dynamic>>>
      getReshuffleCards({required String? deckId}) => (super.noSuchMethod(
            Invocation.method(
              #getReshuffleCards,
              [],
              {#deckId: deckId},
            ),
            returnValue: _i13.Future<
                    _i11
                    .Either<_i17.CardTableFailure, Map<String, dynamic>>>.value(
                _FakeEither_9<_i17.CardTableFailure, Map<String, dynamic>>(
              this,
              Invocation.method(
                #getReshuffleCards,
                [],
                {#deckId: deckId},
              ),
            )),
          ) as _i13.Future<
              _i11.Either<_i17.CardTableFailure, Map<String, dynamic>>>);

  @override
  _i13.Future<
      _i11.Either<_i17.CardTableFailure, Map<String, dynamic>>> getDrawCard({
    required String? count,
    required String? deckId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDrawCard,
          [],
          {
            #count: count,
            #deckId: deckId,
          },
        ),
        returnValue: _i13.Future<
                _i11.Either<_i17.CardTableFailure, Map<String, dynamic>>>.value(
            _FakeEither_9<_i17.CardTableFailure, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getDrawCard,
            [],
            {
              #count: count,
              #deckId: deckId,
            },
          ),
        )),
      ) as _i13
          .Future<_i11.Either<_i17.CardTableFailure, Map<String, dynamic>>>);
}
