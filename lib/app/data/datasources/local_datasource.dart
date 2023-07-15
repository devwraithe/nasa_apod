import '../../domain/entities/image_entity.dart';

abstract class LocalDataSource {
  Future<void> storeImages(List<ImageEntity> images);
  Future<List<ImageEntity>> retrieveImages();
}
