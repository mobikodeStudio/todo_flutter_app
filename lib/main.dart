import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/analytics_screen/analytics_screen.dart';
import 'package:todo_flutter_app/presentation/analytics_screen/bloc/analytics_bloc.dart';
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
      home: AnalyticsScreen(),
    );
  }
}
