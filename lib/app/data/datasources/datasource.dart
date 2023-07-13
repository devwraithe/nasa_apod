import '../models/image_model.dart';

abstract class DataSource {
  Future<List<ImageModel>> getImages();
}
