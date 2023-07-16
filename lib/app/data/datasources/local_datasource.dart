import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/image_entity.dart';

abstract class LocalDataSource {
  Future<void> storeImages(List<ImageEntity> images);
  Future<List<ImageEntity>> retrieveImages();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> storeImages(List<ImageEntity> images) async {
    final box = await Hive.openBox<ImageEntity>('images');
    debugPrint("[Caching in Hive for Offline Support]...");
    await box.clear();
    for (final image in images) {
      await box.put(image.date, image);
    }
    debugPrint("[Cached in Hive, Offline Support Updated]");
    box.close();
  }

  @override
  Future<List<ImageEntity>> retrieveImages() async {
    final box = await Hive.openBox('images');
    debugPrint("[Retrieving Data Cache from Hive]...");
    final dynamicList = box.values.toList();
    final images = dynamicList.cast<ImageEntity>().toList();
    debugPrint("[Retrieved Data Cache from Hive]");
    box.close();
    return images;
  }
}
