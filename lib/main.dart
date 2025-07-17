import 'package:flutter/material.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/add_task_screen/add_task_screen.dart';

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
      home: AddTaskScreen(),
    );
  }
}
