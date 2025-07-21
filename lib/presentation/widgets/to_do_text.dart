import 'package:flutter/material.dart';

class ToDoText extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double fontSize;
  const ToDoText({
    super.key,
    required this.label,
    required this.color,
    required this.fontSize,

    this.textAlign = TextAlign.right,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
