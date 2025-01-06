import 'package:flutter/material.dart';
import 'package:get_it_injectable_example/extensions/future_extension.dart';
import 'package:get_it_injectable_example/screens/view_models/receive_view_model.dart';
import 'package:provider/provider.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: ListView.builder(
        itemCount: viewModel.recipes.length,
        itemBuilder: (context, index) {
          final recipe = viewModel.recipes[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                recipe.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(recipe.name),
              subtitle: Text('${recipe.caloriesPerServing} calories'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await viewModel
              .fetchRecipes()
              .makeWithLoadingDialog(context: context);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
