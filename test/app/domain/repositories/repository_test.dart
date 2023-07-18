import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/utilities/test_helper.mocks.dart';

void main() {
  late Repository repository;

  // define a list of mock ImageEntity objects for testing
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

  // set up the test environment by creating a mock repository instance
  setUp(() => repository = MockRepositoryImpl());

  // test case: should return a list of ImageEntity on success
  test('should return a list of ImageEntity on success', () async {
    // set up the mock behavior of the repository's getImagesRepo method
    when(repository.getImagesRepo()).thenAnswer(
      (_) async => Right(mockImages),
    );

    // call the repository's getImagesRepo method and store the result
    final result = await repository.getImagesRepo();

    // verify that the result is a Right value
    expect(result.isRight(), true);

    // verify that the result value is a List<ImageEntity>
    expect(result.getOrElse(() => []), isA<List<ImageEntity>>());

    // verify that the result list has a length of 2
    expect(result.getOrElse(() => []), hasLength(2));
  });

  // test case: should update local database with images successfully
  test('should update local database with images successfully', () async {
    // call the repository's updateLocalDatabase method with the mock images
    await repository.updateLocalDatabase(mockImages);

    // verify that the repository's updateLocalDatabase method is called once
    verify(repository.updateLocalDatabase(mockImages)).called(1);
  });

  // test case: should retrieve cached images successfully
  test('should retrieve cached images successfully', () async {
    // set up the mock behavior of the repository's getCachedImages method
    when(repository.getCachedImages()).thenAnswer((_) async => mockImages);

    // call the repository's getCachedImages method and store the result
    final result = await repository.getCachedImages();

    // verify that the result is equal to the mock images
    expect(result, equals(mockImages));

    // verify that the repository's getCachedImages method is called once
    verify(repository.getCachedImages()).called(1);
  });
}
