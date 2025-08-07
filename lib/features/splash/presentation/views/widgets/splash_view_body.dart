// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylesphere_app/constant.dart';
import 'package:stylesphere_app/core/services/firebase_auth_service.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/features/auth/presentation/views/login_view.dart';
import 'package:stylesphere_app/features/splash/presentation/views/widgets/animation_logo_line.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1880)).then((value) {
      if (isUserLoggedIn()) {
        // Navigator.pushReplacementNamed(context, HomeView.routeName);
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: KHeroAssetsLogo,
            child: SvgPicture.asset(Assets.assetsLogoLogo),
          ),
          const SizedBox(height: 20),
          const AnimationLine(),
        ],
      ),
    );
  }
}
