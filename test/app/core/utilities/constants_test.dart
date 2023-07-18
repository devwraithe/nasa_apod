import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/env/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Constants', () {
    // test case: has correct string constants
    test('Has correct string constants', () {
      // assert that the string constants have the expected values
      expect(Constants.fontFamily, equals('DMSans'));
      expect(Constants.baseUrl, equals('https://api.nasa.gov'));
      expect(
        Constants.apiPath,
        equals(
          'https://api.nasa.gov/planetary/apod?api_key=${Env.apiKey}&start_date=2023-06-20',
        ),
      );
      expect(Constants.serverError, equals('Error retrieving images'));
      expect(Constants.socketError, equals('No Internet Connection'));
      expect(Constants.unknownError, equals('Something went wrong'));
      expect(
        Constants.lostConnection,
        equals('Please check your internet connection.'),
      );
      expect(
        Constants.timeout,
        equals('Request timed out. Please try again later.'),
      );
    });

    // test case: has correct double constants
    test('Has correct double constants', () {
      // assert that the double constants have the expected values
      expect(Constants.imageHeight, equals(240.0));
    });
  });
}
