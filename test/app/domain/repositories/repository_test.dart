import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/utilities/test_helper.mocks.dart';

void main() {
  late Repository repository;

  final mockImages = [
    const ImageEntity(
      title: 'Image 1',
      date: '2023-07-15',
      explanation: 'This is image 1',
      imgUrl: 'https://example.com/image1.jpg',
    ),
    const ImageEntity(
      title: 'Image 2',
      date: '2023-07-16',
      explanation: 'This is image 2',
      imgUrl: 'https://example.com/image2.jpg',
    ),
  ];

  setUp(() => repository = MockRepositoryImpl());

  test('should return a list of ImageEntity on success', () async {
    when(repository.getImagesRepo()).thenAnswer(
      (_) async => Right(mockImages),
    );

    final result = await repository.getImagesRepo();
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<ImageEntity>>());
    expect(result.getOrElse(() => []), hasLength(2));
  });

  test('should update local database with images successfully', () async {
    await repository.updateLocalDatabase(mockImages);

    verify(repository.updateLocalDatabase(mockImages)).called(1);
  });

  test('should retrieve cached images successfully', () async {
    when(repository.getCachedImages()).thenAnswer((_) async => mockImages);

    final result = await repository.getCachedImages();

    expect(result, equals(mockImages));
    verify(repository.getCachedImages()).called(1);
  });
}
