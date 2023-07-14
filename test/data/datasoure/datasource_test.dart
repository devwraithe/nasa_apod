import 'package:cloudwalk_assessment/app/data/datasources/datasource.dart';
import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/helpers/test_helper.mocks.dart';

void main() {
  group('DataSource', () {
    late DataSource dataSource;

    setUp(() => dataSource = MockDataSource());

    test('should return a list of ImageModel', () async {
      // define the expected result
      final expectedImages = [
        const ImageModel(
          title: "Test Image 1",
          date: "01 June 2023",
          explanation: "Test Explanation 1",
          hdUrl: 'https://example.com/image1.jpg',
        ),
        const ImageModel(
          title: "Test Image 2",
          date: "02 June 2023",
          explanation: "Test Explanation 2",
          hdUrl: 'https://example.com/image2.jpg',
        ),
        const ImageModel(
          title: "Test Image 3",
          date: "03 June 2023",
          explanation: "Test Explanation 3",
          hdUrl: 'https://example.com/image3.jpg',
        ),
      ];

      // set up the mock behavior of the data_source
      when(dataSource.getImages()).thenAnswer((_) async => expectedImages);

      // call the method under test
      final result = await dataSource.getImages();

      // verify the result
      expect(result, expectedImages);

      // verify that the method was called exactly once
      verify(dataSource.getImages()).called(1);
    });
  });
}
