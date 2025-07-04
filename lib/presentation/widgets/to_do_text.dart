import 'package:flutter/material.dart';

class ToDoText extends StatelessWidget {
  final String label;
  final Color color;
  const ToDoText({
    super.key,
    required this.label,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 15, color: color),
    );
  }
}