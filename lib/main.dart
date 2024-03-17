import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/app/slash.dart';
import 'package:slash_task/core/di/set_up.dart';
import 'package:slash_task/core/service/observer.dart';
import 'package:slash_task/firebase_options.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const Slash());
}
