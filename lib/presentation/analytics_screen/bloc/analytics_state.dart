abstract class AnalyticsState {}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final int completedThisWeek;
  final int efficiencyRate;
  final int successRate;
  final double tasksPerDay;
  final List<int> weeklyData;
  final Map<String, int> categoryData;

  AnalyticsLoaded({
    required this.completedThisWeek,
    required this.efficiencyRate,
    required this.successRate,
    required this.tasksPerDay,
    required this.weeklyData,
    required this.categoryData,
  });
}
