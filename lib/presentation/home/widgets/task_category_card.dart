import 'package:flutter/material.dart';

class TaskCategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int taskCount;
  final Color backgroundColor;

  const TaskCategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.taskCount,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: backgroundColor, size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: backgroundColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '$taskCount Tasks',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
