import 'package:cloudwalk_assessment/app/data/datasources/local_datasource.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/image_entity.dart';

// Create a local database class using Hive
class LocalDataSourceImpl implements LocalDataSource {
  // store and retrieve data in the hive box
  @override
  Future<void> storeImages(List<ImageEntity> images) async {
    final box = await Hive.openBox<ImageEntity>('images');
    print("[Writing to Hive]...");

    // Clear the existing box
    await box.clear();

    // Add the new images to the box
    for (final image in images) {
      await box.put(image.date, image);
    }

    print("[Wrote to Hive]");
    box.close();
  }

  @override
  Future<List<ImageEntity>> retrieveImages() async {
    final box = await Hive.openBox('images');
    print("box data - ${box.values.length}");
    final dynamicList = box.values.toList();
    final images = dynamicList.cast<ImageEntity>().toList();
    print("[LDS] $images");
    box.close();
    return images;
  }
}
