import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseManger {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  FireBaseManger({required this.firebaseFirestore, required this.firebaseAuth});

  Future<UserCredential> signUp(
          {required String email, required String password}) async =>
      firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

  Future<void> signOut() async => firebaseAuth.signOut();

  Future<UserCredential> signIn(
          {required String email, required String password}) async =>
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

}
