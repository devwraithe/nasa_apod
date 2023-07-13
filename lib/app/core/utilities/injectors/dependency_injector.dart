import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'images_injector.dart';

final sl = GetIt.instance; // the service locator(sl)

// methods for service location
regFactory<T extends Object>(T Function() factFunc) {
  sl.registerFactory(factFunc);
}

regSingleton<T extends Object>(T Function() factFunc) {
  sl.registerLazySingleton(factFunc);
}

// injectors initialization
void init() {
  imagesInjector();
  regSingleton(() => http.Client());
}
