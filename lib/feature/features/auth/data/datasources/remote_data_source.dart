import 'package:firebase_auth/firebase_auth.dart';
import 'package:slash_task/core/firebase/firbase_response.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signUp(
      {required String email, required String password});


}
