import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesphere_app/constant.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_buttom.dart';
import 'package:stylesphere_app/core/widgets/custom_text_feild.dart';
import 'package:stylesphere_app/features/auth/presentation/manager/cubits/login/login_cubit.dart';
import 'package:stylesphere_app/features/auth/presentation/views/sign_up_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
            const SizedBox(height: 20),
            CustomTextFormFeild(
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              onSaved: (p0) {
                Email = p0!;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormFeild(
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
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<LoginCubit>().loginUser(Email, Password);
                }
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
          ],
        ),
      ),
    );
  }
}
