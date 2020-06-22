import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'common/bloc/simple_bloc_delegate.dart';
import 'common/constants/env.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App(env: EnvValue.production));
}
