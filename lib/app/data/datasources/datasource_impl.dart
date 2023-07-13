import 'dart:convert';
import 'dart:io';

import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/data/models/image_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../core/utilities/constants.dart';
import '../../core/utilities/errors/exceptions.dart';
import 'datasource.dart';

class DataSourceImpl implements DataSource {
  final Client client;
  const DataSourceImpl(this.client);

  @override
  Future<List<ImageModel>> getImages() async {
    final Response response = await client.get(
      Uri.parse(
        "${Constants.apiPath}&start_date=2023-06-20",
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    final data = json.decode(response.body);
    try {
      final List<ImageModel> images = data.map<ImageModel>((image) {
        return ImageModel.fromJson(image);
      }).toList();
      return images;
    } on SocketException catch (e) {
      debugPrint("[SOCKET FAILURE] ${Constants.socketError}: $e");
      throw ConnectionException(
        ConnectionFailure(Constants.socketError),
      );
    } catch (e) {
      debugPrint("[SERVER FAILURE] ${Constants.unknownError}: $e");
      throw ServerException(
        ServerFailure(
          Constants.unknownError,
        ),
      );
    }
  }
}
