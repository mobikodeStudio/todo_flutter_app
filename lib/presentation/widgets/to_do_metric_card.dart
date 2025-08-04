import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? highlight; // optional

  const MetricCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (highlight != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(Icons.trending_up, size: 16, color: Colors.green),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          if (highlight != null) ...[
            const SizedBox(height: 6),
            Text(
              highlight!,
              style: const TextStyle(fontSize: 13, color: Colors.green),
            ),
          ],
        ],
      ),
    );
  }
}
