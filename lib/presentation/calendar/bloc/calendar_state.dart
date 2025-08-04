abstract class CalendarState {}

class CalendarInitialState extends CalendarState {}

class CalendarLoadedState extends CalendarState {
  final DateTime currentDate;
  final DateTime selectedDate;
  final Map<DateTime, List<String>> events;

  CalendarLoadedState({
    required this.currentDate,
    required this.selectedDate,
    required this.events,
  });

  String get monthName => [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ][currentDate.month - 1];

  int get year => currentDate.year;
  List<String> get selectedDateEvents =>
      events[selectedDateOnly(selectedDate)] ?? [];

  static DateTime selectedDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);
}
