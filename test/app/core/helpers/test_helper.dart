import 'package:cloudwalk_assessment/app/data/datasources/datasource.dart';
import 'package:cloudwalk_assessment/app/data/datasources/remote_datasource.dart';
import 'package:cloudwalk_assessment/app/data/repositories/repository_impl.dart';
import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart';
import 'package:cloudwalk_assessment/app/domain/usecases/images_usecase.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  NasaImagesUsecase,
  Repository,
  RepositoryImpl,
  DataSource,
  DataSourceImpl,
  http.Client,
  NavigatorObserver,
  ImagesCubit,
  BuildContext,
])
void main() {}
