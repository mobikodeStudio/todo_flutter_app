import 'package:flutter/material.dart';

class AnalyticsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnalyticsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: kToolbarHeight + 20,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Analytics",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Task Performance Overview",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
