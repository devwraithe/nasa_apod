import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/utilities/errors/failure.dart';

abstract class Repository {
  Future<Either<Failure, List<ImageEntity>>> getImagesRepo();
}
