abstract class IRecipeService {
  Future<List<Map<String, dynamic>>> fetchRecipeData();
  Future<Map<String, dynamic>> createRecipe(Map<String, dynamic> recipeData);
  Future<Map<String, dynamic>> updateRecipe(
      int id, Map<String, dynamic> recipeData);
  Future<void> deleteRecipe(int id);
}
