import 'package:firebase_auth/firebase_auth.dart';
import 'package:slash_task/core/firebase/firbase_response.dart';
import 'package:slash_task/feature/features/auth/domain/repositories/auth_repo.dart';

class AuthUsecase {
 final AuthRepo authRepo;
  const AuthUsecase({required this.authRepo});

  Future<FirbaseResponse<UserCredential>> singUp(
      {required String email, required String password}) async =>await authRepo.signUp(email: email, password: password);
}
