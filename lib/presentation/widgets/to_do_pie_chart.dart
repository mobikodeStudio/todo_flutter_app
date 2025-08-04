import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, int> data;

  const PieChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final total = data.values.fold(0, (sum, item) => sum + item);

    final colorMap = {
      "Work": Colors.blue,
      "Shopping": Colors.orange,
      "Personal": Colors.green,
      "Health": Colors.purple,
    };

    final entries = data.entries.toList();

    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 45, // Increased for thinner rings
              startDegreeOffset: -90,
              sections: entries.map((entry) {
                return PieChartSectionData(
                  color: colorMap[entry.key]!,
                  value: entry.value.toDouble(),
                  title: '',
                  radius: 50, // Kept same for visual size
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryRow(
                    "Work",
                    data["Work"]!,
                    total,
                    colorMap["Work"]!,
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryRow(
                    "Shopping",
                    data["Shopping"]!,
                    total,
                    colorMap["Shopping"]!,
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryRow(
                    "Personal",
                    data["Personal"]!,
                    total,
                    colorMap["Personal"]!,
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryRow(
                    "Health",
                    data["Health"]!,
                    total,
                    colorMap["Health"]!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryRow(String label, int value, int total, Color color) {
    final percentage = ((value / total) * 100).toStringAsFixed(0);
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        Text(label, style: const TextStyle(fontSize: 13)),
        const SizedBox(width: 8),
        Text(
          "$percentage%",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
