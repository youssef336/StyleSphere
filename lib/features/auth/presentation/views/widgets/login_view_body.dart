// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:stylesphere_app/constant.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_buttom.dart';
import 'package:stylesphere_app/core/widgets/custom_text_feild.dart';
import 'package:stylesphere_app/features/auth/presentation/manager/cubits/login/login_cubit.dart';
import 'package:stylesphere_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylesphere_app/features/home/presentation/views/home_view.dart';

enum LoginMethod { email, google, facebook }

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String Email = '';
  String Password = '';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Artboard? artboard;
  StateMachineController? controller;
  SMIBool? isHandsUp, isChecking;
  SMITrigger? trigSuccess, trigFail;
  SMINumber? numLook;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/video/animated_login_character.riv').then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      final smController = StateMachineController.fromArtboard(
        art,
        'Login Machine',
      );

      if (smController != null) {
        art.addController(smController);
        for (var input in smController.inputs) {
          switch (input.name) {
            case 'isHandsUp':
              isHandsUp = input as SMIBool;
              break;
            case 'isChecking':
              isChecking = input as SMIBool;
              break;
            case 'trigSuccess':
              trigSuccess = input as SMITrigger;
              break;
            case 'trigFail':
              trigFail = input as SMITrigger;
              break;
            case 'numLook':
              numLook = input as SMINumber;
              break;
          }
        }
      }

      setState(() {
        artboard = art;
        controller = smController;
      });
    });
  }

  void LookAround() {
    isChecking?.change(true);
    isHandsUp?.change(false);
    numLook?.change(0.0);
  }

  void moveEyes(String value) {
    // Scale character count to a max of 100 for full eye movement
    double scaledValue = (value.length / 20.0 * 50).clamp(0, 100);
    numLook?.change(scaledValue);
  }

  void handUpOnEyes() {
    isHandsUp?.change(true);
    isChecking?.change(false);
  }

  void LoginClick(LoginMethod method) async {
    isChecking?.change(false);
    isHandsUp?.change(false);

    try {
      switch (method) {
        case LoginMethod.email:
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            await context.read<LoginCubit>().loginUser(Email, Password);
            if (context.read<LoginCubit>().isSuccess == true) {
              trigSuccess?.fire();
              await Future.delayed(const Duration(milliseconds: 1500));
              Navigator.pushNamed(context, HomeView.routeName);
            } else {
              trigFail?.fire();
            }
          } else {
            trigFail?.fire();
          }
          break;

        case LoginMethod.google:
          await context.read<LoginCubit>().signInWithGoogle();
          trigSuccess?.fire();
          await Future.delayed(const Duration(milliseconds: 1500));
          Navigator.pushNamed(context, HomeView.routeName);
          break;

        case LoginMethod.facebook:
          await context.read<LoginCubit>().signInWithfacebook();
          trigSuccess?.fire();
          await Future.delayed(const Duration(milliseconds: 1500));
          Navigator.pushNamed(context, HomeView.routeName);
          break;
      }
    } catch (e) {
      trigFail?.fire();
    }

    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        isChecking?.change(false);
        isHandsUp?.change(false);
        numLook?.change(0.0);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: KHeroAssetsLogo,
                  child: SvgPicture.asset(Assets.assetsLogoLogo),
                ),
                const SizedBox(height: 16),
                artboard != null
                    ? SizedBox(
                        height: 200,
                        width: double.infinity,

                        child: Rive(artboard: artboard!, fit: BoxFit.fitWidth),
                      )
                    : const SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                const SizedBox(height: 20),
                CustomTextFormFeild(
                  onChanged: (value) {
                    moveEyes(value);
                  },
                  onTap: () {
                    LookAround();
                  },
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  onSaved: (p0) {
                    Email = p0!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormFeild(
                  onTap: handUpOnEyes,
                  hintText: "Password",
                  textInputType: TextInputType.text,
                  obscureText: true,
                  onSaved: (p0) {
                    Password = p0!;
                  },
                ),
                const SizedBox(height: 40),
                CustomButtom(
                  text: 'Login',
                  onPressed: () {
                    LoginClick(LoginMethod.email);
                  },
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, SignUpView.routeName);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    LoginClick(LoginMethod.google);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFDCDEDE),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 100),
                        const Text(
                          " Login with Google",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.244,
                        ),
                        SvgPicture.asset(
                          Assets.assetsLogoGoogle,
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    LoginClick(LoginMethod.facebook);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFDCDEDE),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 100),
                        const Text(
                          " Login with facebook",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.21,
                        ),
                        SvgPicture.asset(
                          Assets.assetsLogoFacebook,
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
