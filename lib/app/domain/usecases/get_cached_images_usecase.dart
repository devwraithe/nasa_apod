import '../entities/image_entity.dart';
import '../repositories/repository.dart';

class GetCachedImagesUsecase {
  final Repository repo;
  GetCachedImagesUsecase(this.repo);

  Future<List<ImageEntity>> execute() async {
    return await repo.getCachedImages();
  }
}
