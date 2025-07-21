import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_task_screen_event.dart';
import 'add_task_screen_state.dart';

class AddTaskScreenBloc extends Bloc<AddTaskScreenEvent, AddTaskScreenState> {
  AddTaskScreenBloc() : super(AddTaskScreenInitial()) {
    on<OnTextChangeEvent>((event, emit) {
      emit(AddTaskScreenTextChanged(event.title));
    });

    on<OnDescriptionChangeEvent>((event, emit) {
      emit(AddTaskScreenDescriptionChanged(event.description));
    });

    on<OnToggleImportanceEvent>((event, emit) {
      emit(AddTaskImportanceState(event.isImportant));
    });

    on<OnToggleReminderEvent>((event, emit) {
      emit(AddTaskReminderState(event.isReminderSet));
    });

    on<OnCategoryChangeEvent>((event, emit) {
      emit(AddTaskCategoryState(event.category));
    });

    on<OnDatePickedEvent>((event, emit) {
      final currentTime = state is AddTaskDueDateTimeState
          ? (state as AddTaskDueDateTimeState).selectedTime
          : null;
      emit(
        AddTaskDueDateTimeState(
          selectedDate: event.date,
          selectedTime: currentTime,
        ),
      );
    });

    on<OnTimePickedEvent>((event, emit) {
      final currentDate = state is AddTaskDueDateTimeState
          ? (state as AddTaskDueDateTimeState).selectedDate
          : null;
      emit(
        AddTaskDueDateTimeState(
          selectedDate: currentDate,
          selectedTime: event.time,
        ),
      );
    });
  }
}
