import 'package:flutter/material.dart';

class ToDoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  final String textHintLabel;
  final bool isSuffixIconVisible;
  final IconData? suffixIcon;
  final VoidCallback? suffixOnClick;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  const ToDoTextField({
    super.key,
    required this.controller,
    required this.textLabel,
    required this.textHintLabel,
    this.isSuffixIconVisible = false,
    this.suffixIcon,
    this.suffixOnClick,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    // This is declared and used *inside* the build method correctly
    final bool shouldObscureText = isSuffixIconVisible ? obscureText : false;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textLabel,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: shouldObscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: textHintLabel,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: isSuffixIconVisible && suffixIcon != null
                ? GestureDetector(
              onTap: suffixOnClick,
              child: Icon(suffixIcon),
            )
                : null,
          ),
        ),
      ],
    );
  }
}
