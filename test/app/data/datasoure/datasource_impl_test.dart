import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/exceptions.dart';
import 'package:cloudwalk_assessment/app/data/datasources/datasource_impl.dart';
import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../core/helpers/test_helper.mocks.dart';

void main() {
  late DataSourceImpl dataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    dataSource = DataSourceImpl(mockClient);
  });

  group('should show a list of images', () {
    final mockSuccessResponse = Response(
      json.encode([
        {
          'title': "Test Image 1",
          'date': "01 June 2023",
          'explanation': "Test Explanation 1",
          'hdurl': 'https://example.com/image1.jpg',
        },
        {
          'title': "Test Image 2",
          'date': "02 June 2023",
          'explanation': "Test Explanation 2",
          'hdurl': 'https://example.com/image2.jpg',
        },
      ]),
      200,
    );

    // success
    test('should return a list of ImageModel on successful response', () async {
      // set up the mock behavior of the client
      when(
        mockClient.get(
          Uri.parse(Constants.apiPath),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => mockSuccessResponse);

      // call the method under test
      final result = await dataSource.getImages();

      // verify the result
      expect(result, isA<List<ImageModel>>());
      expect(result.length, 2);

      // verify that the client was called exactly once with the correct arguments
      verify(
        mockClient.get(
          Uri.parse(Constants.apiPath),
          headers: anyNamed('headers'),
        ),
      ).called(1);
    });
  });

  // network socket
  test('should throw a NetworkException on SocketException', () async {
    // Arrange
    when(mockClient.get(Uri.parse(Constants.apiPath),
            headers: anyNamed('headers')))
        .thenThrow(const SocketException('No internet connection'));

    // Assert
    expect(() => dataSource.getImages(), throwsA(isA<NetworkException>()));
  });

  // network timeout
  test('should throw a NetworkException on TimeoutException', () async {
    // Arrange
    when(mockClient.get(Uri.parse(Constants.apiPath),
            headers: anyNamed('headers')))
        .thenThrow(TimeoutException('Request timed out'));

    // Act
    Future<List<ImageModel>> function() async {
      return await dataSource.getImages();
    }

    // Assert
    expect(function, throwsA(isA<NetworkException>()));
  });

  // ======================

  // non-200
  test('should throw a ServerException on non-200 status code', () async {
    // set up the mock behavior of the Client
    when(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async {
      // return a mocked non-200 status code response
      return Response('Error', 400);
    });

    // call the method under test and expect a ServerException to be thrown
    expect(
      () => dataSource.getImages(),
      throwsA(isA<ServerException>()),
    );
  });

  // platform exception
  test('should throw a ServerException on PlatformException', () async {
    // Arrange
    when(mockClient.get(Uri.parse(Constants.apiPath),
            headers: anyNamed('headers')))
        .thenThrow(PlatformException(
            code: 'platform_error', message: 'Platform error'));

    // Act
    Future<List<ImageModel>> function() async {
      return await dataSource.getImages();
    }

    // Assert
    expect(function, throwsA(isA<ServerException>()));
  });

  // other
  test('should throw a ServerException on other exceptions', () async {
    // Arrange
    when(mockClient.get(Uri.parse(Constants.apiPath),
            headers: anyNamed('headers')))
        .thenThrow(Exception('Some error occurred'));

    // Act
    Future<List<ImageModel>> function() async {
      return await dataSource.getImages();
    }

    // Assert
    expect(function, throwsA(isA<ServerException>()));
  });
}
