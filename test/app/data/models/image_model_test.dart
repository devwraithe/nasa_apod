import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // define a mock JSON object representing an image
  const mockImageJson = {
    'title': 'Test Image',
    'date': '2023-07-15',
    'explanation': 'This is a test image',
    'hdurl': 'https://example.com/image.jpg',
  };

  // test case: ImageModel can be created from JSON
  test('ImageModel can be created from JSON', () {
    // create an ImageModel instance from the mock JSON
    final imageModel = ImageModel.fromJson(mockImageJson);

    // verify that the ImageModel properties match the expected values
    expect(imageModel.title, 'Test Image');
    expect(imageModel.date, '2023-07-15');
    expect(imageModel.explanation, 'This is a test image');
    expect(imageModel.imgUrl, 'https://example.com/image.jpg');
  });

  // test case: ImageModel can be converted to ImageEntity
  test('ImageModel can be converted to ImageEntity', () {
    // create an ImageModel instance from the mock JSON
    final imageModel = ImageModel.fromJson(mockImageJson);

    // convert the ImageModel to an ImageEntity
    final imageEntity = imageModel.toEntity();

    // verify that the ImageEntity properties match the expected values
    expect(imageEntity.title, 'Test Image');
    expect(imageEntity.date, '2023-07-15');
    expect(imageEntity.explanation, 'This is a test image');
    expect(imageEntity.imgUrl, 'https://example.com/image.jpg');
  });

  // test case: ImageModel instances with the same properties are considered equal
  test('ImageModel instances with the same properties are considered equal',
      () {
    // create two ImageModel instances from the same mock JSON
    final imageModel1 = ImageModel.fromJson(mockImageJson);
    final imageModel2 = ImageModel.fromJson(mockImageJson);

    // verify that the two ImageModel instances are considered equal
    expect(imageModel1, equals(imageModel2));
  });

  // test case: ImageModel instances with different properties are not considered equal
  test(
      'ImageModel instances with different properties are not considered equal',
      () {
    // create two ImageModel instances with different mock JSON objects
    final imageModel1 = ImageModel.fromJson(mockImageJson);
    final imageModel2 = ImageModel.fromJson(const {
      'title': 'Different Image',
      'date': '2023-07-16',
      'explanation': 'This is a different image',
      'hdurl': 'https://example.com/different.jpg',
    });

    // verify that the two ImageModel instances are not considered equal
    expect(imageModel1, isNot(equals(imageModel2)));
  });
}
