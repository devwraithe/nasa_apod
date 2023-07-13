import 'package:cloudwalk_assessment/app/data/repositories/repository_impl.dart';
import 'package:cloudwalk_assessment/app/domain/repositories/repository.dart';
import 'package:cloudwalk_assessment/app/domain/usecases/images_usecase.dart';

import '../../../data/datasources/datasource.dart';
import '../../../data/datasources/datasource_impl.dart';
import '../../../presentation/cubits/nasa_images/nasa_images_cubit.dart';
import 'dependency_injector.dart';

void imagesInjector() {
  regSingleton(() => ImagesCubit(sl()));
  regSingleton(() => NasaImagesUsecase(sl()));
  regSingleton<Repository>(() => RepositoryImpl(sl()));
  regSingleton<DataSource>(() => DataSourceImpl(sl()));
}
