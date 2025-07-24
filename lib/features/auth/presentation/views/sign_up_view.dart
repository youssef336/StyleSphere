import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stylesphere_app/core/services/get_it_service.dart';

import 'package:stylesphere_app/features/auth/domain/repo/auth_repo.dart';
import 'package:stylesphere_app/features/auth/presentation/manager/cubits/sign_up/sign_up_cubit.dart';

import 'package:stylesphere_app/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/signUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(getIt<AuthRepo>()),
          child: const SignUpViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
