import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/core/firebase/firbase_response.dart';
import 'package:slash_task/feature/features/auth/domain/usecases/auth_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TextEditingController singUpEmailController = TextEditingController();
  final TextEditingController singUpPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthCubit({required this.authUsecase}) : super(AuthInitial());
  final AuthUsecase authUsecase;

 Future<void> signUp() async {
    emit(AuthLoading());
    FirbaseResponse<UserCredential> data = await authUsecase.singUp(
        email: singUpEmailController.text,
        password: singUpPasswordController.text);
    data.when(
      data: (value) => emit(AuthSuccess()),
      error: (error) => emit(AuthError(error)),
    );
  }
}
