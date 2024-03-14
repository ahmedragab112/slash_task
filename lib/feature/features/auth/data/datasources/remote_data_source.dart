import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signUp(
      {required String email, required String password});

  Future<UserCredential> signIn(
      {required String email, required String password});
}
