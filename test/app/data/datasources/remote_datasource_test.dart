import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/exceptions.dart';
import 'package:cloudwalk_assessment/app/data/datasources/remote_datasource.dart';
import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../core/utilities/test_helper.mocks.dart';

void main() {
  late MockClient mockClient;
  late RemoteDataSourceImpl dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = RemoteDataSourceImpl(mockClient);
  });

  final expectedSuccessResponse = Response(
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

  test('should return a list of ImageModel on successful response', () async {
    when(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => expectedSuccessResponse);

    final result = await dataSource.getImages();

    expect(result, isA<List<ImageModel>>());
    expect(result.length, 2);

    verify(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).called(1);
  });

  test('should throw a ServerException on non-200 status code', () async {
    when(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async {
      return Response(Constants.serverError, 400);
    });

    expect(
      dataSource.getImages(),
      throwsA(isA<ServerException>()),
    );
  });

  test('should throw a NetworkException on SocketException', () async {
    when(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).thenThrow(SocketException(Constants.socketError));

    expect(
      dataSource.getImages(),
      throwsA(
        isA<NetworkException>(),
      ),
    );
  });

  test('should throw a NetworkException on TimeoutException', () async {
    when(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).thenThrow(TimeoutException(Constants.timeout));

    expect(
      dataSource.getImages(),
      throwsA(
        isA<NetworkException>(),
      ),
    );
  });

  test('should throw a ServerException on PlatformException', () async {
    when(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).thenThrow(
      PlatformException(
        code: 'platform_error',
        message: 'Platform error',
      ),
    );

    expect(
      dataSource.getImages(),
      throwsA(
        isA<ServerException>(),
      ),
    );
  });

  test('should throw a ServerException on other exceptions', () async {
    when(
      mockClient.get(
        Uri.parse(Constants.apiPath),
        headers: anyNamed('headers'),
      ),
    ).thenThrow(Exception(Constants.unknownError));

    expect(
      dataSource.getImages(),
      throwsA(
        isA<ServerException>(),
      ),
    );
  });
}
