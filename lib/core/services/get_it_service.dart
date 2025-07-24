import 'package:get_it/get_it.dart';
import 'package:stylesphere_app/core/services/firebase_auth_service.dart';
import 'package:stylesphere_app/core/services/main/auth_service.dart';
import 'package:stylesphere_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:stylesphere_app/features/auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthService>()),
  );
}
