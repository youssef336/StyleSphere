import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylesphere_app/core/helper_functions/build_error_bar.dart';
import 'package:stylesphere_app/core/services/firebase_auth_service.dart';
import 'package:stylesphere_app/core/widgets/custom_modal_progress_hub.dart';
import 'package:stylesphere_app/features/auth/presentation/manager/cubits/login/login_cubit.dart';
import 'package:stylesphere_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:stylesphere_app/features/home/presentation/views/home_view.dart';

class LoginViewBodyBlocBuilder extends StatelessWidget {
  const LoginViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: const LoginViewBody(),
        );
      },
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is LoginError) {
          showErrorBar(context, state.message);
        }
      },
    );
  }
}
