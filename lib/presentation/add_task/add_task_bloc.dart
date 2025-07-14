import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/presentation/add_task/add_task_event.dart';
import 'package:todo_flutter_app/presentation/add_task/add_task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initial()) {
    on<TaskTextChanged>(_onTaskTextChanged);
  }

  void _onTaskTextChanged(TaskTextChanged event, Emitter<TaskState> emit) {
    final isButtonEnabled =
        event.title.isNotEmpty && event.date != null && event.time != null;

    emit(state.copyWith(isButtonEnabled: isButtonEnabled));
  }
}
