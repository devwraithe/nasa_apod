import 'package:cloudwalk_assessment/app/core/utilities/errors/exceptions.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/utilities/errors/failure.dart';
import '../datasources/datasource.dart';

class RepositoryImpl implements Repository {
  final DataSource dataSource;
  RepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ImageEntity>>> getImagesRepo() async {
    try {
      final result = await dataSource.getImages();
      return Right(result.map((image) => image.toEntity()).toList());
    } on ConnectionException catch (f) {
      return Left(ConnectionFailure(f.err.message));
    } on ServerException catch (f) {
      return Left(ServerFailure(f.err.message));
    }
  }
}
