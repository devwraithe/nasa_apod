import 'dart:async';
import 'dart:io';

import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/exceptions.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:cloudwalk_assessment/app/data/repositories/repository_impl.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/utilities/test_helper.mocks.dart';

void main() {
  late RepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = RepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
    );
  });

  final mockImages = [
    const ImageEntity(
      title: 'Image 1',
      date: '2021-09-01',
      explanation: 'Explanation 1',
      imgUrl: 'https://image1.com',
    ),
    const ImageEntity(
      title: 'Image 2',
      date: '2021-09-02',
      explanation: 'Explanation 2',
      imgUrl: 'https://image2.com',
    ),
  ];

  final mockImageModels = [
    const ImageModel(
      title: 'Image 1',
      date: '2021-09-01',
      explanation: 'Explanation 1',
      imgUrl: 'https://image1.com',
    ),
    const ImageModel(
      title: 'Image 2',
      date: '2021-09-02',
      explanation: 'Explanation 2',
      imgUrl: 'https://image2.com',
    ),
  ];

  test('should return a list of ImageEntity on success', () async {
    when(mockRemoteDataSource.getImages()).thenAnswer(
      (_) async => mockImageModels,
    );

    final result = await repository.getImagesRepo();

    expect(result, isA<Right<Failure, List<ImageEntity>>>());
    expect(result.getOrElse(() => throw Error()), isA<List<ImageEntity>>());
    expect(result.getOrElse(() => throw Error()).length, 2);
  });

  test('should return a ServerFailure on ServerException', () async {
    final serverException = ServerException(Failure(Constants.serverError));
    when(mockRemoteDataSource.getImages()).thenThrow(serverException);

    final result = await repository.getImagesRepo();

    expect(result, isA<Left<Failure, List<ImageEntity>>>());
    expect(result.isLeft(), true);
    expect(
      result.fold(
        (failure) => failure,
        (_) => throw Error(),
      ),
      serverException.failure,
    );
  });

  test('should return a Failure on SocketException', () async {
    when(mockRemoteDataSource.getImages()).thenThrow(
      SocketException(Constants.socketError),
    );

    final result = await repository.getImagesRepo();

    expect(result, isA<Left<Failure, List<ImageEntity>>>());
    expect(result.isLeft(), true);
    expect(
      result.fold((failure) => failure, (_) => throw Error()),
      Failure(Constants.lostConnection),
    );
  });

  test('should return a Failure on TimeoutException', () async {
    when(mockRemoteDataSource.getImages()).thenThrow(
      TimeoutException(Constants.timeout),
    );

    final result = await repository.getImagesRepo();

    expect(result, isA<Left<Failure, List<ImageEntity>>>());
    expect(result.isLeft(), true);
    expect(
      result.fold((failure) => failure, (_) => throw Error()),
      Failure(Constants.timeout),
    );
  });

  test('should return a Failure on other exceptions', () async {
    when(mockRemoteDataSource.getImages()).thenThrow(
      Exception(Constants.unknownError),
    );

    final result = await repository.getImagesRepo();

    expect(result, isA<Left<Failure, List<ImageEntity>>>());
    expect(result.isLeft(), true);
    expect(
      result.fold(
        (failure) => failure,
        (_) => throw Error(),
      ),
      isA<Failure>(),
    );
  });

  test('should update local database with images successfully', () async {
    await repository.updateLocalDatabase(mockImages);

    verify(mockLocalDataSource.storeImages(mockImages)).called(1);
  });

  test('should retrieve cached images successfully', () async {
    when(mockLocalDataSource.retrieveImages())
        .thenAnswer((_) async => mockImages);

    final result = await repository.getCachedImages();

    expect(result, equals(mockImages));
    verify(mockLocalDataSource.retrieveImages()).called(1);
  });
}
