import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../../core/utilities/constants.dart';
import '../../core/utilities/errors/exceptions.dart';
import 'datasource.dart';

class DataSourceImpl implements DataSource {
  final Client client;
  const DataSourceImpl(this.client);

  @override
  Future<List<ImageModel>> getImages() async {
    try {
      final Response response = await client.get(
        Uri.parse(Constants.apiPath),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      );

      final data = json.decode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(
          Failure(Constants.serverError),
        );
      } else {
        final List<ImageModel> images = data.map<ImageModel>((image) {
          return ImageModel.fromJson(image);
        }).toList();
        return images;
      }
    } on PlatformException catch (e) {
      throw ServerException(Failure(e.toString()));
    } on SocketException {
      throw NetworkException(Failure(Constants.lostConnection));
    } on TimeoutException {
      throw NetworkException(Failure(Constants.timeout));
    } catch (e) {
      throw ServerException(Failure(Constants.unknownError));
    }
  }
}
