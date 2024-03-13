import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/app/slash.dart';
import 'package:slash_task/core/di/set_up.dart';
import 'package:slash_task/core/service/observer.dart';

void main() {
  setupLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const Slash());
}
