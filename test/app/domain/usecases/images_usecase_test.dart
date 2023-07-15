import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/domain/usecases/images_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/helpers/test_helper.mocks.dart';

void main() {
  late NasaImagesUsecase usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = NasaImagesUsecase(mockRepository);
  });

  test('should return a list of ImageEntity on successful response', () async {
    // Arrange
    final imageEntities = <ImageEntity>[
      /* create your test ImageEntity objects */
    ];
    when(mockRepository.getImagesRepo())
        .thenAnswer((_) async => Right(imageEntities));

    // Act
    final result = await usecase.execute();

    // Assert
    expect(result, equals(Right(imageEntities)));
    verify(mockRepository.getImagesRepo()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a Failure when repository returns a Left', () async {
    // Arrange
    final failure = Failure('Test failure');
    when(mockRepository.getImagesRepo()).thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase.execute();

    // Assert
    expect(result, equals(Left(failure)));
    verify(mockRepository.getImagesRepo()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  // Add more test cases as needed
}
