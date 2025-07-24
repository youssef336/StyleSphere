import 'package:flutter/material.dart';
import 'package:stylesphere_app/core/widgets/custom_buttom.dart';
import 'package:stylesphere_app/core/widgets/custom_text_feild.dart';
import 'package:stylesphere_app/features/auth/presentation/views/sign_up_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTextFormFeild(
            hintText: "Email",
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          const CustomTextFormFeild(
            hintText: "Password",
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          const SizedBox(height: 40),
          CustomButtom(text: 'Login', onPressed: () {}),
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
    );
  }
}
