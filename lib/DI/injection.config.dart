// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_it_injectable_example/repository/implementations/recipe_repository.dart'
    as _i212;
import 'package:get_it_injectable_example/repository/interfaces/IRecipe_repository.dart'
    as _i401;
import 'package:get_it_injectable_example/screens/view_models/receive_view_model.dart'
    as _i152;
import 'package:get_it_injectable_example/service/implementations/network_service.dart'
    as _i126;
import 'package:get_it_injectable_example/service/implementations/recipe_service.dart'
    as _i524;
import 'package:get_it_injectable_example/service/interfaces/IRecipe_service.dart'
    as _i283;
import 'package:get_it_injectable_example/storage/local_storage.dart' as _i890;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i890.LocalStorage>(() => _i890.LocalStorage());
  gh.factory<_i126.NetworkServiceImpl>(
      () => _i126.NetworkServiceImpl(gh<_i361.Dio>()));
  gh.singleton<_i283.IRecipeService>(() => _i524.RecipeService(
        gh<_i126.NetworkServiceImpl>(),
        gh<_i890.LocalStorage>(),
      ));
  gh.factory<_i401.IRecipeRepository>(() => _i212.RecipeRepository(
        gh<_i890.LocalStorage>(),
        service: gh<_i283.IRecipeService>(),
      ));
  gh.factory<_i152.RecipeViewModel>(
      () => _i152.RecipeViewModel(repository: gh<_i401.IRecipeRepository>()));
  return getIt;
}
