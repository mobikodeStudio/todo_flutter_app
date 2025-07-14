import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/Bloc/signup_event.dart';
import 'package:todo_flutter_app/presentation/home/home_screen.dart';
import 'package:todo_flutter_app/presentation/login/login_screen.dart';
import 'package:todo_flutter_app/presentation/signup/signup_screen.dart';
import 'package:todo_flutter_app/presentation/splash/splash_bloc.dart';
import 'package:todo_flutter_app/presentation/splash/splash_screen.dart';
import 'package:todo_flutter_app/presentation/Bloc/signup_bloc.dart';


void main() {
  serviceInjector(); // Initialize dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
       home: BlocProvider(
        create: (BuildContext context) => getIt<SignupBloc>()..add(SignupInitialEvent()),

      child: const SignupScreen (),
       ),

    );
  }
}

