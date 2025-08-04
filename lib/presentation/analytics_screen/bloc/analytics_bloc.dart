import 'package:flutter_bloc/flutter_bloc.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(AnalyticsInitial()) {
    on<LoadAnalyticsEvent>((event, emit) {
      emit(
        AnalyticsLoaded(
          completedThisWeek: 24,
          efficiencyRate: 87,
          successRate: 92,
          tasksPerDay: 6.2,
          weeklyData: [7, 6, 9, 6, 4, 3, 2],
          categoryData: {
            'Work': 40,
            'Personal': 30,
            'Shopping': 15,
            'Health': 15,
          },
        ),
      );
    });
  }
}
