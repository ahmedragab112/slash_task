import 'package:firebase_auth/firebase_auth.dart';
import 'package:slash_task/core/firebase/firbase_response.dart';
import 'package:slash_task/feature/features/auth/data/datasources/remote_data_source.dart';
import 'package:slash_task/feature/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImplementation({required this.authRemoteDataSource});
  @override
  Future<FirbaseResponse<UserCredential>> signUp(
      {required String email, required String password}) async {
    try {
      var data =
          await authRemoteDataSource.signUp(email: email, password: password);
      return FirbaseResponse.data(data);
    } on FirebaseAuthException catch (e) {
      return FirbaseResponse.error(error: e.message!);
    } catch (e) {
      return FirbaseResponse.error(error: e.toString());
    }
  }

  @override
  Future<FirbaseResponse<UserCredential>> singIn(
      {required String email, required String password}) async {
    try {
      var data =
          await authRemoteDataSource.signIn(email: email, password: password);
      return FirbaseResponse.data(data);
    } on FirebaseAuthException catch (e) {
      return FirbaseResponse.error(error: e.message!);
    } catch (e) {
      return FirbaseResponse.error(error: e.toString());
    }
  }
}
