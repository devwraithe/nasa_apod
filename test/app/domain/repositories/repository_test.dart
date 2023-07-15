import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRepository extends Repository {
  @override
  Future<Either<Failure, List<ImageEntity>>> getImagesRepo() async {
    // Return a dummy result
    final images = <ImageEntity>[
      const ImageEntity(
        title: 'Image 1',
        date: '2023-07-15',
        explanation: 'This is image 1',
        hdUrl: 'https://example.com/image1.jpg',
      ),
      const ImageEntity(
        title: 'Image 2',
        date: '2023-07-16',
        explanation: 'This is image 2',
        hdUrl: 'https://example.com/image2.jpg',
      ),
    ];
    return Right(images);
  }
}

void main() {
  late Repository repository;

  setUp(() {
    repository = MockRepository();
  });

  test('getImagesRepo should return a list of ImageEntity on success',
      () async {
    final result = await repository.getImagesRepo();
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<ImageEntity>>());
    expect(result.getOrElse(() => []), hasLength(2));
  });
}
