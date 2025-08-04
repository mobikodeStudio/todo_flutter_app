import 'package:flutter_bloc/flutter_bloc.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {

  CalendarBloc() : super(CalendarInitialState()) {
    on<LoadInitialCalendarEvent>(_onLoadInitial);
    on<PreviousMonthEvent>(_onPreviousMonth);
    on<NextMonthEvent>(_onNextMonth);
    on<SelectDateEvent>(_onSelectDate);
    on<SelectMonthEvent>(_onSelectMonth);
  }

  void _onLoadInitial(LoadInitialCalendarEvent event,
      Emitter<CalendarState> emit) {
    final now = DateTime.now();
    final events = _generateEvents(now);
    emit(CalendarLoadedState(
      currentDate: now,
      selectedDate: now,
      events: events,
    ));
  }

  void _onPreviousMonth(PreviousMonthEvent event, Emitter<CalendarState> emit) {
    if (state is CalendarLoadedState) {
      final currentState = state as CalendarLoadedState;
      final newDate = DateTime(
          currentState.currentDate.year, currentState.currentDate.month - 1);
      emit(CalendarLoadedState(
        currentDate: newDate,
        selectedDate: currentState.selectedDate,
        events: currentState.events,
      ));
    }
  }

  void _onNextMonth(NextMonthEvent event, Emitter<CalendarState> emit) {
    if (state is CalendarLoadedState) {
      final currentState = state as CalendarLoadedState;
      final newDate = DateTime(
          currentState.currentDate.year, currentState.currentDate.month + 1);
      emit(CalendarLoadedState(
        currentDate: newDate,
        selectedDate: currentState.selectedDate,
        events: currentState.events,
      ));
    }
  }

  void _onSelectDate(SelectDateEvent event, Emitter<CalendarState> emit) {
    if (state is CalendarLoadedState) {
      final currentState = state as CalendarLoadedState;
      emit(CalendarLoadedState(
        currentDate: currentState.currentDate,
        selectedDate: event.selectedDate,
        events: currentState.events,
      ));
    }
  }

  void _onSelectMonth(SelectMonthEvent event, Emitter<CalendarState> emit) {
    if (state is CalendarLoadedState) {
      final currentState = state as CalendarLoadedState;
      final newDate = DateTime(
          currentState.currentDate.year, event.monthIndex + 1);
      emit(CalendarLoadedState(
        currentDate: newDate,
        selectedDate: currentState.selectedDate,
        events: currentState.events,
      ));
    }
  }

  Map<DateTime, List<String>> _generateEvents(DateTime month) {
    final Map<DateTime, List<String>> newEvents = {};

    final year = month.year;
    final m = month.month;

    newEvents[DateTime(year, m, 5)] = ['Code Review'];
    newEvents[DateTime(year, m, 15)] = ['Client Call'];
    newEvents[DateTime(year, m, 25)] = ['Team Meeting', 'Project Review', 'Client Call'];

    return newEvents;
  }


}