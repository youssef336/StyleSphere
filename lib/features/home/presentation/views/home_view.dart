import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_app_bar.dart';
import 'package:stylesphere_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: HomeViewBody()));
  }
}
