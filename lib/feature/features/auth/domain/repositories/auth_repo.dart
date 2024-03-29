import 'package:firebase_auth/firebase_auth.dart';
import 'package:slash_task/core/firebase/firbase_response.dart';

abstract class AuthRepo {

  Future<FirbaseResponse<UserCredential>> signUp({required String email, required String password}) ;

Future<FirbaseResponse<UserCredential>>singIn({required String email, required String password});
}