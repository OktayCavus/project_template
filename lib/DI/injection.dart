import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:get_it_injectable_example/DI/injection.config.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

@InjectableInit(asExtension: false)
FutureOr<GetIt> configureDependencies() async {
  getIt.registerLazySingleton<Dio>(() => Dio());

  return init(getIt);
}
