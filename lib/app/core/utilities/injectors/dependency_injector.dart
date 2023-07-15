import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../data/datasources/datasource.dart';
import '../../../data/datasources/datasource_impl.dart';
import '../../../data/repositories/repository_impl.dart';
import '../../../domain/repositories/repository.dart';
import '../../../domain/usecases/images_usecase.dart';
import '../../../presentation/cubits/nasa_images/nasa_images_cubit.dart';

final sl = GetIt.instance; // the service locator(sl)

void regFactory<T extends Object>(T Function() factFunc) {
  sl.registerFactory(factFunc);
}

void regSingleton<T extends Object>(T Function() factFunc) {
  sl.registerLazySingleton(factFunc);
}

void init() {
  // can have a separate method as app scales
  regSingleton(() => ImagesCubit(sl()));
  regSingleton(() => NasaImagesUsecase(sl()));
  regSingleton<Repository>(() => RepositoryImpl(sl()));
  regSingleton<DataSource>(() => DataSourceImpl(sl()));

  regSingleton(() => http.Client());
}
