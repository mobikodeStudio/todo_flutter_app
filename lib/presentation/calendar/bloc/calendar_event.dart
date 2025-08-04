abstract class CalendarEvent {}

class LoadInitialCalendarEvent extends CalendarEvent {}

class PreviousMonthEvent extends CalendarEvent {}

class NextMonthEvent extends CalendarEvent {}

class SelectDateEvent extends CalendarEvent {
  final DateTime selectedDate;

  SelectDateEvent({required this.selectedDate});
}

class SelectMonthEvent extends CalendarEvent {
  final int monthIndex;

  SelectMonthEvent({required this.monthIndex});
}


