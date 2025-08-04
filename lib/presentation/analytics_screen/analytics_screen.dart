import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/to_do_bar_chart.dart';
import '../widgets/to_do_metric_card.dart';
import '../widgets/to_do_pie_chart.dart';
import 'bloc/analytics_bloc.dart';
import 'bloc/analytics_event.dart';
import 'bloc/analytics_state.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnalyticsBloc()..add(LoadAnalyticsEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Analytics",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Task performance overview",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<AnalyticsBloc, AnalyticsState>(
          builder: (context, state) {
            if (state is AnalyticsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MetricCard(
                            title: "24",
                            subtitle: "Completed this week",
                            highlight: "+12% vs last week",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: MetricCard(
                            title: "87%",
                            subtitle: "Efficiency rate",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    const Padding(
                      padding: EdgeInsets.only(left: 56),
                      child: Text(
                        "Weekly Overview",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    BarChartWidget(data: state.weeklyData),

                    const SizedBox(height: 24),

                    const Padding(
                      padding: EdgeInsets.only(left: 56),
                      child: Text(
                        "Task Categories",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    PieChartWidget(data: state.categoryData),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: MetricCard(
                            title: "${state.tasksPerDay}",
                            subtitle: "tasks per day",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: MetricCard(
                            title: "${state.successRate}%",
                            subtitle: "success rate",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
