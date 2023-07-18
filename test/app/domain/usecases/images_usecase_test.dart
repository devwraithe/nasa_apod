import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/domain/usecases/images_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/utilities/test_helper.mocks.dart';

void main() {
  late ImagesUsecase usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = ImagesUsecase(mockRepository);
  });

  final mockImages = [
    const ImageEntity(
      title: 'Image 1',
      date: '2023-07-12',
      explanation: 'This is image 1',
      imgUrl: 'https://example.com/image1.jpg',
    ),
    const ImageEntity(
      title: 'Image 2',
      date: '2023-07-15',
      explanation: 'This is image 2',
      imgUrl: 'https://example.com/image2.jpg',
    ),
  ];

  test('should return a list of ImageEntity on successful response', () async {
    when(mockRepository.getImagesRepo()).thenAnswer(
      (_) async => Right(mockImages),
    );

    final result = await usecase.getImages();

    expect(result, equals(Right(mockImages)));
    verify(mockRepository.getImagesRepo()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a Failure when repository returns a Left', () async {
    const failure = Failure('Test failure');
    when(mockRepository.getImagesRepo()).thenAnswer(
      (_) async => const Left(failure),
    );

    final result = await usecase.getImages();

    expect(result, equals(const Left(failure)));
    verify(mockRepository.getImagesRepo()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should update the local database with given images', () async {
    await usecase.updateLocalDatabase(mockImages);

    verify(mockRepository.updateLocalDatabase(mockImages)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should retrieve cached images successfully', () async {
    when(mockRepository.getCachedImages()).thenAnswer(
      (_) async => mockImages,
    );

    final result = await usecase.getCachedImages();

    expect(result, equals(mockImages));

    verify(mockRepository.getCachedImages()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
