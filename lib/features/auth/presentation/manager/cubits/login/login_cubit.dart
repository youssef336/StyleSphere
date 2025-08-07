// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylesphere_app/features/auth/domain/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());
  bool isSuccess = false;
  Future<void> loginUser(String email, String password) async {
    isSuccess = false;
    emit(LoginLoading());
    final result = await loginRepo.loginUser(email, password);
    result.fold(
      (l) => emit(LoginError(message: l.message)),
      (r) => emit(LoginSuccess(isSuccess: isSuccess = true)),
    );
  }

  Future<void> signInWithGoogle() async {
    isSuccess = false;
    emit(LoginLoading());
    final result = await loginRepo.signInWithGoogle();
    result.fold(
      (l) => emit(LoginError(message: l.message)),
      (r) => emit(LoginSuccess(isSuccess: isSuccess = true)),
    );
  }

  Future<void> signInWithfacebook() async {
    isSuccess = false;
    emit(LoginLoading());
    final result = await loginRepo.signInWithfacebook();
    result.fold(
      (l) => emit(LoginError(message: l.message)),
      (r) => emit(LoginSuccess(isSuccess: isSuccess = true)),
    );
  }
}
