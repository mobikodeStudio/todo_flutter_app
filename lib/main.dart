import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/add_task/add_task.dart';
import 'package:todo_flutter_app/presentation/add_task/add_task_bloc.dart';
import 'package:todo_flutter_app/presentation/login/bloc/login_bloc.dart';
import 'package:todo_flutter_app/presentation/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Bloc App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => getIt<LoginBloc>(),
        child: const LoginPage(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:todo_flutter_app/presentation/add_task_screen/add_task_screen.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo Bloc App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: AddTask(),
//     );
//   }
// }
