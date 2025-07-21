import 'package:flutter/material.dart';

class TaskCategoryCard extends StatelessWidget {
  final String title;
  final String taskCount;
  final Color backgroundColor;
  final IconData icon;

  const TaskCategoryCard({
    super.key,
    required this.title,
    required this.taskCount,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2, // Makes card compact; adjust as needed
      child: Container(
        padding: const EdgeInsets.all(12), // reduced padding
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              taskCount,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
