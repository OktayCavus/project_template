import 'package:flutter/material.dart';
import 'package:get_it_injectable_example/repository/interfaces/IRecipe_repository.dart';
import 'package:get_it_injectable_example/models/recipe.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeViewModel extends ChangeNotifier {
  final IRecipeRepository _repository;
  List<Recipe> _recipes = [];

  RecipeViewModel({required IRecipeRepository repository})
      : _repository = repository;

  List<Recipe> get recipes => _recipes;

  Future<void> fetchRecipes() async {
    try {
      _recipes = await _repository.getRecipes();
    } catch (error) {
      print('error:  $error');
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}
