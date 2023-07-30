import '../entities/image_entity.dart';
import '../repositories/repository.dart';

class UpdateLocalDbUsecase {
  final Repository repo;
  UpdateLocalDbUsecase(this.repo);

  Future<void> execute(List<ImageEntity> images) async {
    return await repo.updateLocalDatabase(images);
  }
}
