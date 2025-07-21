import 'package:flutter/material.dart';

class ToDoSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const ToDoSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: title.isNotEmpty
          ? Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            )
          : null,
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).colorScheme.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
