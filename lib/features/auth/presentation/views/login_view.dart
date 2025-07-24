import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylesphere_app/core/services/get_it_service.dart';
import 'package:stylesphere_app/features/auth/domain/repo/auth_repo.dart';
import 'package:stylesphere_app/features/auth/presentation/manager/cubits/login/login_cubit.dart';
import 'package:stylesphere_app/features/auth/presentation/views/widgets/login_view_body_bloc_builder.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(getIt<AuthRepo>()),
          child: const LoginViewBodyBlocBuilder(),
        ),
      ),
    );
  }
}
