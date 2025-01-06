import 'package:get_it_injectable_example/service/implementations/network_service.dart';
import 'package:get_it_injectable_example/service/interfaces/IRecipe_service.dart';
import 'package:get_it_injectable_example/storage/local_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IRecipeService)
class RecipeService implements IRecipeService {
  final NetworkServiceImpl _networkService;
  final LocalStorage _localStorage;
  RecipeService(this._networkService, this._localStorage);

  getHeaders() async {
    return {"Authorization": "Bearer ${await _localStorage.getString('a')}"};
  }

  final String _baseUrl = 'https://dummyjson.com/recipes';

  @override
  Future<List<Map<String, dynamic>>> fetchRecipeData() async {
    print(await getHeaders());
    try {
      final response = await _networkService.get(url: _baseUrl);
      if (response.statusCode == 200) {
        final data = response.data;
        return List<Map<String, dynamic>>.from(data['recipes']);
      } else {
        throw Exception('Failed to fetch recipes');
      }
    } catch (e) {
      throw Exception('Failed to fetch recipes: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> createRecipe(
      Map<String, dynamic> recipeData) async {
    try {
      final response = await _networkService.post(
        url: _baseUrl,
        data: recipeData,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to create recipe');
      }
    } catch (e) {
      throw Exception('Failed to create recipe: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateRecipe(
      int id, Map<String, dynamic> recipeData) async {
    try {
      final response = await _networkService.put(
        url: '$_baseUrl/$id',
        data: recipeData,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to update recipe');
      }
    } catch (e) {
      throw Exception('Failed to update recipe: $e');
    }
  }

  @override
  Future<void> deleteRecipe(int id) async {
    try {
      final response = await _networkService.delete(
        url: '$_baseUrl/$id',
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete recipe');
      }
    } catch (e) {
      throw Exception('Failed to delete recipe: $e');
    }
  }
}
