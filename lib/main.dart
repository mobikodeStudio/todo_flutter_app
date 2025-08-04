import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/calendar/bloc/calendar_bloc.dart';
import 'package:todo_flutter_app/presentation/calendar/bloc/calendar_event.dart';
import 'package:todo_flutter_app/presentation/calendar/calendar_screen.dart';
import 'package:todo_flutter_app/presentation/settings/bloc/settings_bloc.dart';
import 'package:todo_flutter_app/presentation/settings/bloc/settings_event.dart';
import 'package:todo_flutter_app/presentation/settings/settings_screen.dart';
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
        create: (_) => getIt<SplashBloc>()..add(InitialSplashLOadEvent()),
        child: const   Splash()
      ),
    );
  }
}
