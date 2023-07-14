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

import '../../core/helpers/test_helper.mocks.dart';

void main() {
  late RepositoryImpl repository;
  late MockDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockDataSource();
    repository = RepositoryImpl(mockDataSource);
  });

  group('getImagesRepo', () {
    test('should return a list of ImageEntity on successful response',
        () async {
      // Arrange
      final imageModels = [
        ImageModel(
          title: 'Image 1',
          date: '2021-09-01',
          explanation: 'Explanation 1',
          hdUrl: 'https://image1.com',
        ),
        ImageModel(
          title: 'Image 2',
          date: '2021-09-02',
          explanation: 'Explanation 2',
          hdUrl: 'https://image2.com',
        ),
      ];
      when(mockDataSource.getImages()).thenAnswer((_) async => imageModels);

      // Act
      final result = await repository.getImagesRepo();

      // Assert
      expect(result, isA<Right<Failure, List<ImageEntity>>>());
      expect(result.getOrElse(() => throw Error()), isA<List<ImageEntity>>());
      expect(result.getOrElse(() => throw Error()).length, 2);
    });

    test('should return a ServerFailure on ServerException', () async {
      // Arrange
      final serverException = ServerException(Failure(Constants.serverError));
      when(mockDataSource.getImages()).thenThrow(serverException);

      // Act
      final result = await repository.getImagesRepo();

      // Assert
      expect(result, isA<Left<Failure, List<ImageEntity>>>());
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure, (_) => throw Error()),
          serverException.failure);
    });

    test('should return a Failure on SocketException', () async {
      // Arrange
      when(mockDataSource.getImages())
          .thenThrow(SocketException('No internet connection'));

      // Act
      final result = await repository.getImagesRepo();

      // Assert
      expect(result, isA<Left<Failure, List<ImageEntity>>>());
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure, (_) => throw Error()),
          Failure(Constants.lostConnection));
    });

    test('should return a Failure on TimeoutException', () async {
      // Arrange
      when(mockDataSource.getImages())
          .thenThrow(TimeoutException('Request timed out'));

      // Act
      final result = await repository.getImagesRepo();

      // Assert
      expect(result, isA<Left<Failure, List<ImageEntity>>>());
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure, (_) => throw Error()),
          Failure(Constants.timeout));
    });

    test('should return a Failure on other exceptions', () async {
      // Arrange
      when(mockDataSource.getImages())
          .thenThrow(Exception('Some error occurred'));

      // Act
      final result = await repository.getImagesRepo();

      // Assert
      expect(result, isA<Left<Failure, List<ImageEntity>>>());
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure, (_) => throw Error()),
          isA<Failure>());
    });
  });
}
