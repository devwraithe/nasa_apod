// Mocks generated by Mockito 5.4.2 from annotations
// in cloudwalk_assessment/test/app/core/utilities/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;
import 'dart:convert' as _i19;
import 'dart:typed_data' as _i20;

import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart'
    as _i15;
import 'package:cloudwalk_assessment/app/data/datasources/local_datasource.dart'
    as _i7;
import 'package:cloudwalk_assessment/app/data/datasources/remote_datasource.dart'
    as _i6;
import 'package:cloudwalk_assessment/app/data/models/image_model.dart' as _i18;
import 'package:cloudwalk_assessment/app/data/repositories/repository_impl.dart'
    as _i17;
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart'
    as _i16;
import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart'
    as _i4;
import 'package:cloudwalk_assessment/app/domain/usecases/get_images_usecase.dart'
    as _i14;
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart'
    as _i11;
import 'package:cloudwalk_assessment/app/presentation/cubits/images_states.dart'
    as _i3;
import 'package:connectivity_plus/connectivity_plus.dart' as _i2;
import 'package:dartz/dartz.dart' as _i5;
import 'package:flutter/services.dart' as _i10;
import 'package:flutter_bloc/flutter_bloc.dart' as _i13;
import 'package:hive/hive.dart' as _i9;
import 'package:hive/src/box/default_compaction_strategy.dart' as _i22;
import 'package:hive/src/box/default_key_comparator.dart' as _i21;
import 'package:http/http.dart' as _i8;
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

class _FakeConnectivity_0 extends _i1.SmartFake implements _i2.Connectivity {
  _FakeConnectivity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeImagesStates_1 extends _i1.SmartFake implements _i3.ImagesStates {
  _FakeImagesStates_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRepository_2 extends _i1.SmartFake implements _i4.Repository {
  _FakeRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoteDataSource_4 extends _i1.SmartFake
    implements _i6.RemoteDataSource {
  _FakeRemoteDataSource_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocalDataSource_5 extends _i1.SmartFake
    implements _i7.LocalDataSource {
  _FakeLocalDataSource_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeClient_6 extends _i1.SmartFake implements _i8.Client {
  _FakeClient_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHiveInterface_7 extends _i1.SmartFake implements _i9.HiveInterface {
  _FakeHiveInterface_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_8 extends _i1.SmartFake implements _i8.Response {
  _FakeResponse_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_9 extends _i1.SmartFake
    implements _i8.StreamedResponse {
  _FakeStreamedResponse_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBox_10<E1> extends _i1.SmartFake implements _i9.Box<E1> {
  _FakeBox_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLazyBox_11<E1> extends _i1.SmartFake implements _i9.LazyBox<E1> {
  _FakeLazyBox_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMethodCodec_12 extends _i1.SmartFake implements _i10.MethodCodec {
  _FakeMethodCodec_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBinaryMessenger_13 extends _i1.SmartFake
    implements _i10.BinaryMessenger {
  _FakeBinaryMessenger_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ImagesCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagesCubit extends _i1.Mock implements _i11.ImagesCubit {
  MockImagesCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Connectivity get connectivity => (super.noSuchMethod(
        Invocation.getter(#connectivity),
        returnValue: _FakeConnectivity_0(
          this,
          Invocation.getter(#connectivity),
        ),
      ) as _i2.Connectivity);
  @override
  _i3.ImagesStates get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeImagesStates_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.ImagesStates);
  @override
  _i12.Stream<_i3.ImagesStates> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i12.Stream<_i3.ImagesStates>.empty(),
      ) as _i12.Stream<_i3.ImagesStates>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  _i12.Future<void> getImages() => (super.noSuchMethod(
        Invocation.method(
          #getImages,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  void emit(_i3.ImagesStates? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i13.Change<_i3.ImagesStates>? change) => super.noSuchMethod(
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
  _i12.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
}

/// A class which mocks [ImagesUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagesUsecase extends _i1.Mock implements _i14.ImagesUsecase {
  MockImagesUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Repository get repo => (super.noSuchMethod(
        Invocation.getter(#repo),
        returnValue: _FakeRepository_2(
          this,
          Invocation.getter(#repo),
        ),
      ) as _i4.Repository);
  @override
  _i12.Future<_i5.Either<_i15.Failure, List<_i16.ImageEntity>>> getImages() =>
      (super.noSuchMethod(
        Invocation.method(
          #getImages,
          [],
        ),
        returnValue:
            _i12.Future<_i5.Either<_i15.Failure, List<_i16.ImageEntity>>>.value(
                _FakeEither_3<_i15.Failure, List<_i16.ImageEntity>>(
          this,
          Invocation.method(
            #getImages,
            [],
          ),
        )),
      ) as _i12.Future<_i5.Either<_i15.Failure, List<_i16.ImageEntity>>>);
  @override
  _i12.Future<void> updateLocalDatabase(List<_i16.ImageEntity>? images) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLocalDatabase,
          [images],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<List<_i16.ImageEntity>> getCachedImages() => (super.noSuchMethod(
        Invocation.method(
          #getCachedImages,
          [],
        ),
        returnValue:
            _i12.Future<List<_i16.ImageEntity>>.value(<_i16.ImageEntity>[]),
      ) as _i12.Future<List<_i16.ImageEntity>>);
}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository extends _i1.Mock implements _i4.Repository {
  MockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<
      _i5
          .Either<_i15.Failure, List<_i16.ImageEntity>>> getImagesRepo() =>
      (super.noSuchMethod(
        Invocation.method(
          #getImagesRepo,
          [],
        ),
        returnValue:
            _i12.Future<_i5.Either<_i15.Failure, List<_i16.ImageEntity>>>.value(
                _FakeEither_3<_i15.Failure, List<_i16.ImageEntity>>(
          this,
          Invocation.method(
            #getImagesRepo,
            [],
          ),
        )),
      ) as _i12.Future<_i5.Either<_i15.Failure, List<_i16.ImageEntity>>>);
  @override
  _i12.Future<void> updateLocalDatabase(List<_i16.ImageEntity>? images) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLocalDatabase,
          [images],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<List<_i16.ImageEntity>> getCachedImages() => (super.noSuchMethod(
        Invocation.method(
          #getCachedImages,
          [],
        ),
        returnValue:
            _i12.Future<List<_i16.ImageEntity>>.value(<_i16.ImageEntity>[]),
      ) as _i12.Future<List<_i16.ImageEntity>>);
}

/// A class which mocks [RepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepositoryImpl extends _i1.Mock implements _i17.RepositoryImpl {
  MockRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.RemoteDataSource get dataSource => (super.noSuchMethod(
        Invocation.getter(#dataSource),
        returnValue: _FakeRemoteDataSource_4(
          this,
          Invocation.getter(#dataSource),
        ),
      ) as _i6.RemoteDataSource);
  @override
  _i7.LocalDataSource get localDataSource => (super.noSuchMethod(
        Invocation.getter(#localDataSource),
        returnValue: _FakeLocalDataSource_5(
          this,
          Invocation.getter(#localDataSource),
        ),
      ) as _i7.LocalDataSource);
  @override
  _i12.Future<
      _i5
          .Either<_i15.Failure, List<_i16.ImageEntity>>> getImagesRepo() =>
      (super.noSuchMethod(
        Invocation.method(
          #getImagesRepo,
          [],
        ),
        returnValue:
            _i12.Future<_i5.Either<_i15.Failure, List<_i16.ImageEntity>>>.value(
                _FakeEither_3<_i15.Failure, List<_i16.ImageEntity>>(
          this,
          Invocation.method(
            #getImagesRepo,
            [],
          ),
        )),
      ) as _i12.Future<_i5.Either<_i15.Failure, List<_i16.ImageEntity>>>);
  @override
  _i12.Future<void> updateLocalDatabase(List<_i16.ImageEntity>? images) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLocalDatabase,
          [images],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<List<_i16.ImageEntity>> getCachedImages() => (super.noSuchMethod(
        Invocation.method(
          #getCachedImages,
          [],
        ),
        returnValue:
            _i12.Future<List<_i16.ImageEntity>>.value(<_i16.ImageEntity>[]),
      ) as _i12.Future<List<_i16.ImageEntity>>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i6.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<List<_i18.ImageModel>> getImages() => (super.noSuchMethod(
        Invocation.method(
          #getImages,
          [],
        ),
        returnValue:
            _i12.Future<List<_i18.ImageModel>>.value(<_i18.ImageModel>[]),
      ) as _i12.Future<List<_i18.ImageModel>>);
}

/// A class which mocks [RemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSourceImpl extends _i1.Mock
    implements _i6.RemoteDataSourceImpl {
  MockRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_6(
          this,
          Invocation.getter(#client),
        ),
      ) as _i8.Client);
  @override
  _i12.Future<List<_i18.ImageModel>> getImages() => (super.noSuchMethod(
        Invocation.method(
          #getImages,
          [],
        ),
        returnValue:
            _i12.Future<List<_i18.ImageModel>>.value(<_i18.ImageModel>[]),
      ) as _i12.Future<List<_i18.ImageModel>>);
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i7.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<void> storeImages(List<_i16.ImageEntity>? images) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeImages,
          [images],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<List<_i16.ImageEntity>> retrieveImages() => (super.noSuchMethod(
        Invocation.method(
          #retrieveImages,
          [],
        ),
        returnValue:
            _i12.Future<List<_i16.ImageEntity>>.value(<_i16.ImageEntity>[]),
      ) as _i12.Future<List<_i16.ImageEntity>>);
}

/// A class which mocks [LocalDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSourceImpl extends _i1.Mock
    implements _i7.LocalDataSourceImpl {
  MockLocalDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.HiveInterface get hiveInterface => (super.noSuchMethod(
        Invocation.getter(#hiveInterface),
        returnValue: _FakeHiveInterface_7(
          this,
          Invocation.getter(#hiveInterface),
        ),
      ) as _i9.HiveInterface);
  @override
  _i12.Future<void> storeImages(List<_i16.ImageEntity>? images) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeImages,
          [images],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<List<_i16.ImageEntity>> retrieveImages() => (super.noSuchMethod(
        Invocation.method(
          #retrieveImages,
          [],
        ),
        returnValue:
            _i12.Future<List<_i16.ImageEntity>>.value(<_i16.ImageEntity>[]),
      ) as _i12.Future<List<_i16.ImageEntity>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i8.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i8.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i8.Response>.value(_FakeResponse_8(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i12.Future<_i8.Response>);
  @override
  _i12.Future<_i8.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i8.Response>.value(_FakeResponse_8(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i12.Future<_i8.Response>);
  @override
  _i12.Future<_i8.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i8.Response>.value(_FakeResponse_8(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response>);
  @override
  _i12.Future<_i8.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i8.Response>.value(_FakeResponse_8(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response>);
  @override
  _i12.Future<_i8.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i8.Response>.value(_FakeResponse_8(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response>);
  @override
  _i12.Future<_i8.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i8.Response>.value(_FakeResponse_8(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response>);
  @override
  _i12.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<String>.value(''),
      ) as _i12.Future<String>);
  @override
  _i12.Future<_i20.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i20.Uint8List>.value(_i20.Uint8List(0)),
      ) as _i12.Future<_i20.Uint8List>);
  @override
  _i12.Future<_i8.StreamedResponse> send(_i8.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i12.Future<_i8.StreamedResponse>.value(_FakeStreamedResponse_9(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i12.Future<_i8.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Box].
///
/// See the documentation for Mockito's code generation for more information.
class MockBox<E> extends _i1.Mock implements _i9.Box<E> {
  MockBox() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Iterable<E> get values => (super.noSuchMethod(
        Invocation.getter(#values),
        returnValue: <E>[],
      ) as Iterable<E>);
  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: '',
      ) as String);
  @override
  bool get isOpen => (super.noSuchMethod(
        Invocation.getter(#isOpen),
        returnValue: false,
      ) as bool);
  @override
  bool get lazy => (super.noSuchMethod(
        Invocation.getter(#lazy),
        returnValue: false,
      ) as bool);
  @override
  Iterable<dynamic> get keys => (super.noSuchMethod(
        Invocation.getter(#keys),
        returnValue: <dynamic>[],
      ) as Iterable<dynamic>);
  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);
  @override
  bool get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: false,
      ) as bool);
  @override
  bool get isNotEmpty => (super.noSuchMethod(
        Invocation.getter(#isNotEmpty),
        returnValue: false,
      ) as bool);
  @override
  Iterable<E> valuesBetween({
    dynamic startKey,
    dynamic endKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #valuesBetween,
          [],
          {
            #startKey: startKey,
            #endKey: endKey,
          },
        ),
        returnValue: <E>[],
      ) as Iterable<E>);
  @override
  E? getAt(int? index) => (super.noSuchMethod(Invocation.method(
        #getAt,
        [index],
      )) as E?);
  @override
  Map<dynamic, E> toMap() => (super.noSuchMethod(
        Invocation.method(
          #toMap,
          [],
        ),
        returnValue: <dynamic, E>{},
      ) as Map<dynamic, E>);
  @override
  dynamic keyAt(int? index) => super.noSuchMethod(Invocation.method(
        #keyAt,
        [index],
      ));
  @override
  _i12.Stream<_i9.BoxEvent> watch({dynamic key}) => (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
          {#key: key},
        ),
        returnValue: _i12.Stream<_i9.BoxEvent>.empty(),
      ) as _i12.Stream<_i9.BoxEvent>);
  @override
  bool containsKey(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i12.Future<void> put(
    dynamic key,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            key,
            value,
          ],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> putAt(
    int? index,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAt,
          [
            index,
            value,
          ],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> putAll(Map<dynamic, E>? entries) => (super.noSuchMethod(
        Invocation.method(
          #putAll,
          [entries],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<int> add(E? value) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [value],
        ),
        returnValue: _i12.Future<int>.value(0),
      ) as _i12.Future<int>);
  @override
  _i12.Future<Iterable<int>> addAll(Iterable<E>? values) => (super.noSuchMethod(
        Invocation.method(
          #addAll,
          [values],
        ),
        returnValue: _i12.Future<Iterable<int>>.value(<int>[]),
      ) as _i12.Future<Iterable<int>>);
  @override
  _i12.Future<void> delete(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> deleteAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #deleteAt,
          [index],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> deleteAll(Iterable<dynamic>? keys) => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [keys],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> compact() => (super.noSuchMethod(
        Invocation.method(
          #compact,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<int> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i12.Future<int>.value(0),
      ) as _i12.Future<int>);
  @override
  _i12.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> flush() => (super.noSuchMethod(
        Invocation.method(
          #flush,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
}

/// A class which mocks [HiveInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveInterface extends _i1.Mock implements _i9.HiveInterface {
  MockHiveInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void init(
    String? path, {
    _i9.HiveStorageBackendPreference? backendPreference =
        _i9.HiveStorageBackendPreference.native,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #init,
          [path],
          {#backendPreference: backendPreference},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i12.Future<_i9.Box<E>> openBox<E>(
    String? name, {
    _i9.HiveCipher? encryptionCipher,
    _i9.KeyComparator? keyComparator = _i21.defaultKeyComparator,
    _i9.CompactionStrategy? compactionStrategy = _i22.defaultCompactionStrategy,
    bool? crashRecovery = true,
    String? path,
    _i20.Uint8List? bytes,
    String? collection,
    List<int>? encryptionKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #openBox,
          [name],
          {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #bytes: bytes,
            #collection: collection,
            #encryptionKey: encryptionKey,
          },
        ),
        returnValue: _i12.Future<_i9.Box<E>>.value(_FakeBox_10<E>(
          this,
          Invocation.method(
            #openBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #bytes: bytes,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
      ) as _i12.Future<_i9.Box<E>>);
  @override
  _i12.Future<_i9.LazyBox<E>> openLazyBox<E>(
    String? name, {
    _i9.HiveCipher? encryptionCipher,
    _i9.KeyComparator? keyComparator = _i21.defaultKeyComparator,
    _i9.CompactionStrategy? compactionStrategy = _i22.defaultCompactionStrategy,
    bool? crashRecovery = true,
    String? path,
    String? collection,
    List<int>? encryptionKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #openLazyBox,
          [name],
          {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #collection: collection,
            #encryptionKey: encryptionKey,
          },
        ),
        returnValue: _i12.Future<_i9.LazyBox<E>>.value(_FakeLazyBox_11<E>(
          this,
          Invocation.method(
            #openLazyBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
      ) as _i12.Future<_i9.LazyBox<E>>);
  @override
  _i9.Box<E> box<E>(String? name) => (super.noSuchMethod(
        Invocation.method(
          #box,
          [name],
        ),
        returnValue: _FakeBox_10<E>(
          this,
          Invocation.method(
            #box,
            [name],
          ),
        ),
      ) as _i9.Box<E>);
  @override
  _i9.LazyBox<E> lazyBox<E>(String? name) => (super.noSuchMethod(
        Invocation.method(
          #lazyBox,
          [name],
        ),
        returnValue: _FakeLazyBox_11<E>(
          this,
          Invocation.method(
            #lazyBox,
            [name],
          ),
        ),
      ) as _i9.LazyBox<E>);
  @override
  bool isBoxOpen(String? name) => (super.noSuchMethod(
        Invocation.method(
          #isBoxOpen,
          [name],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i12.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> deleteBoxFromDisk(
    String? name, {
    String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBoxFromDisk,
          [name],
          {#path: path},
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  _i12.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
  @override
  List<int> generateSecureKey() => (super.noSuchMethod(
        Invocation.method(
          #generateSecureKey,
          [],
        ),
        returnValue: <int>[],
      ) as List<int>);
  @override
  _i12.Future<bool> boxExists(
    String? name, {
    String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #boxExists,
          [name],
          {#path: path},
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);
  @override
  void resetAdapters() => super.noSuchMethod(
        Invocation.method(
          #resetAdapters,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerAdapter<T>(
    _i9.TypeAdapter<T>? adapter, {
    bool? internal = false,
    bool? override = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerAdapter,
          [adapter],
          {
            #internal: internal,
            #override: override,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool isAdapterRegistered(int? typeId) => (super.noSuchMethod(
        Invocation.method(
          #isAdapterRegistered,
          [typeId],
        ),
        returnValue: false,
      ) as bool);
  @override
  void ignoreTypeId<T>(int? typeId) => super.noSuchMethod(
        Invocation.method(
          #ignoreTypeId,
          [typeId],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MethodChannel].
///
/// See the documentation for Mockito's code generation for more information.
class MockMethodChannel extends _i1.Mock implements _i10.MethodChannel {
  MockMethodChannel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: '',
      ) as String);
  @override
  _i10.MethodCodec get codec => (super.noSuchMethod(
        Invocation.getter(#codec),
        returnValue: _FakeMethodCodec_12(
          this,
          Invocation.getter(#codec),
        ),
      ) as _i10.MethodCodec);
  @override
  _i10.BinaryMessenger get binaryMessenger => (super.noSuchMethod(
        Invocation.getter(#binaryMessenger),
        returnValue: _FakeBinaryMessenger_13(
          this,
          Invocation.getter(#binaryMessenger),
        ),
      ) as _i10.BinaryMessenger);
  @override
  _i12.Future<T?> invokeMethod<T>(
    String? method, [
    dynamic arguments,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #invokeMethod,
          [
            method,
            arguments,
          ],
        ),
        returnValue: _i12.Future<T?>.value(),
      ) as _i12.Future<T?>);
  @override
  _i12.Future<List<T>?> invokeListMethod<T>(
    String? method, [
    dynamic arguments,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #invokeListMethod,
          [
            method,
            arguments,
          ],
        ),
        returnValue: _i12.Future<List<T>?>.value(),
      ) as _i12.Future<List<T>?>);
  @override
  _i12.Future<Map<K, V>?> invokeMapMethod<K, V>(
    String? method, [
    dynamic arguments,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #invokeMapMethod,
          [
            method,
            arguments,
          ],
        ),
        returnValue: _i12.Future<Map<K, V>?>.value(),
      ) as _i12.Future<Map<K, V>?>);
  @override
  void setMethodCallHandler(
          _i12.Future<dynamic> Function(_i10.MethodCall)? handler) =>
      super.noSuchMethod(
        Invocation.method(
          #setMethodCallHandler,
          [handler],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Connectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivity extends _i1.Mock implements _i2.Connectivity {
  MockConnectivity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Stream<_i2.ConnectivityResult> get onConnectivityChanged =>
      (super.noSuchMethod(
        Invocation.getter(#onConnectivityChanged),
        returnValue: _i12.Stream<_i2.ConnectivityResult>.empty(),
      ) as _i12.Stream<_i2.ConnectivityResult>);
  @override
  _i12.Future<_i2.ConnectivityResult> checkConnectivity() =>
      (super.noSuchMethod(
        Invocation.method(
          #checkConnectivity,
          [],
        ),
        returnValue: _i12.Future<_i2.ConnectivityResult>.value(
            _i2.ConnectivityResult.bluetooth),
      ) as _i12.Future<_i2.ConnectivityResult>);
}
