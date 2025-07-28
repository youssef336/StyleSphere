import 'package:flutter/material.dart';
import 'package:stylesphere_app/features/auth/presentation/views/login_view.dart';
import 'package:stylesphere_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:stylesphere_app/features/home/presentation/views/home_view.dart';
import 'package:stylesphere_app/features/home/presentation/views/men_view.dart';
import 'package:stylesphere_app/features/home/presentation/views/model_details.dart';
import 'package:stylesphere_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case MenView.routeName:
      return MaterialPageRoute(builder: (_) => const MenView());
    case ModelDetails.routeName:
      return MaterialPageRoute(builder: (_) => const ModelDetails());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
