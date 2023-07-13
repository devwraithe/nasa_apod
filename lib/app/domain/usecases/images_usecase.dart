import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/utilities/errors/failure.dart';
import '../entities/image_entity.dart';

class NasaImagesUsecase {
  final Repository repo;
  NasaImagesUsecase(this.repo);

  Future<Either<Failure, List<ImageEntity>>> execute() async {
    return await repo.getImagesRepo();
  }
}
