import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/helper_functions/on_generate_routes.dart';
import 'package:stylesphere_app/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const StyleSphere());
}

class StyleSphere extends StatelessWidget {
  const StyleSphere({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: HomeView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
