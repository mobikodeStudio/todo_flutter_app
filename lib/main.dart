import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/add_task_screen/add_task_screen.dart';
import 'package:todo_flutter_app/presentation/add_task_screen/bloc/add_task_screen_bloc.dart';

import 'package:todo_flutter_app/presentation/login/bloc/login_bloc.dart';
import 'package:todo_flutter_app/presentation/login/login_screen.dart';
import 'package:todo_flutter_app/presentation/signup/bloc/signup_bloc.dart';
import 'package:todo_flutter_app/presentation/signup/signup_screen.dart';
import 'package:todo_flutter_app/presentation/splash/splash_bloc.dart';
import 'package:todo_flutter_app/presentation/splash/splash_screen.dart';

void main() {
  serviceInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Bloc App',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Wrapping SignupScreen with BlocProvider
      home: BlocProvider(
        create: (context) => AddTaskScreenBloc(),
        child: const AddTaskScreen(),
      ),
    );
  }
}
