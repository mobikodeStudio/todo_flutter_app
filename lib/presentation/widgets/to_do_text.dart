import 'package:flutter/material.dart';

class ToDoText extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;
  final double? fontSize;

  const ToDoText({
    super.key,
    required this.label,
    required this.color,
    this.textAlign = TextAlign.right,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: TextStyle(fontSize: 15, color: color),
    );
  }
}
