import 'package:flutter/material.dart';
import 'package:get_it_injectable_example/screens/ui/receive_screen.dart';
import 'package:get_it_injectable_example/screens/view_models/receive_view_model.dart';

import 'package:get_it_injectable_example/DI/injection.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependencies
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<RecipeViewModel>(),
        ),
      ],
      child: const MaterialApp(
        home: ExampleScreen(),
      ),
    );
  }
}
