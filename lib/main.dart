import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/helper_functions/on_generate_routes.dart';
import 'package:stylesphere_app/core/services/get_it_service.dart';
import 'package:stylesphere_app/features/home/presentation/views/home_view.dart';
import 'package:stylesphere_app/features/splash/presentation/views/splash_view.dart';
import 'package:stylesphere_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const StyleSphere());
}

class StyleSphere extends StatelessWidget {
  const StyleSphere({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
