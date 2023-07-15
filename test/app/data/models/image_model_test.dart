import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const imageModelJson = {
    'title': 'Test Image',
    'date': '2023-07-15',
    'explanation': 'This is a test image',
    'hdurl': 'https://example.com/image.jpg',
  };

  test('ImageModel can be created from JSON', () {
    final imageModel = ImageModel.fromJson(imageModelJson);

    expect(imageModel.title, 'Test Image');
    expect(imageModel.date, '2023-07-15');
    expect(imageModel.explanation, 'This is a test image');
    expect(imageModel.hdUrl, 'https://example.com/image.jpg');
  });

  test('ImageModel can be converted to ImageEntity', () {
    final imageModel = ImageModel.fromJson(imageModelJson);

    final imageEntity = imageModel.toEntity();

    expect(imageEntity.title, 'Test Image');
    expect(imageEntity.date, '2023-07-15');
    expect(imageEntity.explanation, 'This is a test image');
    expect(imageEntity.hdUrl, 'https://example.com/image.jpg');
  });

  test('ImageModel instances with the same properties are considered equal',
      () {
    final imageModel1 = ImageModel.fromJson(imageModelJson);
    final imageModel2 = ImageModel.fromJson(imageModelJson);

    expect(imageModel1, equals(imageModel2));
  });

  test(
      'ImageModel instances with different properties are not considered equal',
      () {
    final imageModel1 = ImageModel.fromJson(imageModelJson);
    final imageModel2 = ImageModel.fromJson(const {
      'title': 'Different Image',
      'date': '2023-07-16',
      'explanation': 'This is a different image',
      'hdurl': 'https://example.com/different.jpg',
    });

    expect(imageModel1, isNot(equals(imageModel2)));
  });
}
