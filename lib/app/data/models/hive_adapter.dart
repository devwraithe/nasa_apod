import 'package:hive/hive.dart';

// part 'image.g.dart'; // Generated file by the Hive generator

@HiveType(typeId: 0)
class Image extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String imageUrl;

// Additional fields and methods
}
