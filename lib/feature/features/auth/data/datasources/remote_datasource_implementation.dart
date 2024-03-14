import 'package:firebase_auth/firebase_auth.dart';
import 'package:slash_task/core/firebase/firebase_manger.dart';
import 'package:slash_task/feature/features/auth/data/datasources/remote_data_source.dart';

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final FireBaseManger fireBaseManger;
  const AuthRemoteDataSourceImplementation({required this.fireBaseManger});
  @override
  Future<UserCredential> signUp(
      {required String email, required String password}) {
        return fireBaseManger.signUp(email: email, password: password);
      }
}
