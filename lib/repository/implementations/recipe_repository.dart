import 'package:get_it/get_it.dart';
import 'package:get_it_injectable_example/DI/injection.dart';
import 'package:get_it_injectable_example/repository/interfaces/IRecipe_repository.dart';

import 'package:get_it_injectable_example/service/interfaces/IRecipe_service.dart';

import 'package:get_it_injectable_example/models/recipe.dart';

import 'package:get_it_injectable_example/storage/local_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IRecipeRepository)
class RecipeRepository implements IRecipeRepository {
  final IRecipeService _service;
  final LocalStorage _localStorage;

  RecipeRepository(this._localStorage, {required IRecipeService service})
      : _service = service;

  @override
  Future<List<Recipe>> getRecipes() async {
    await _localStorage.saveString("a", "value");

    final data = await _service.fetchRecipeData();

    List<Recipe> recipeList =
        data.map((json) => Recipe.fromJson(json)).toList();

    return recipeList;
  }

  @override
  Future<Recipe> createRecipe(Recipe recipe) async {
    final data = await _service.createRecipe(recipe.toJson());
    return Recipe.fromJson(data);
  }

  @override
  Future<Recipe> updateRecipe(int id, Recipe recipe) async {
    final data = await _service.updateRecipe(id, recipe.toJson());

    return Recipe.fromJson(data);
  }

  @override
  Future<void> deleteRecipe(int id) async {
    await _service.deleteRecipe(id);
  }
}
