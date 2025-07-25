import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesphere_app/constant.dart';
import 'package:stylesphere_app/core/utils/assets.dart';
import 'package:stylesphere_app/core/widgets/custom_buttom.dart';
import 'package:stylesphere_app/core/widgets/custom_text_feild.dart';
import 'package:stylesphere_app/features/auth/presentation/manager/cubits/sign_up/sign_up_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String Name = '';
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
              hintText: "Name",
              textInputType: TextInputType.text,
              onSaved: (p0) {
                Name = p0!;
              },
            ),
            const SizedBox(height: 10),
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
              text: 'Sign up',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SignUpCubit>().signUpUser(
                    name: Name,
                    email: Email,
                    password: Password,
                  );
                }
              },
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.pop(context);
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
