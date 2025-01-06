import 'package:get_it_injectable_example/models/recipe.dart';

abstract class IRecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<Recipe> createRecipe(Recipe recipe);
  Future<Recipe> updateRecipe(int id, Recipe recipe);
  Future<void> deleteRecipe(int id);
}
