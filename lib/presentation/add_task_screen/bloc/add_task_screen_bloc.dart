import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_task_screen_event.dart';
part 'add_task_screen_state.dart';

class AddTaskScreenBloc extends Bloc<AddTaskScreenEvent, AddTaskScreenState> {
  AddTaskScreenBloc() : super(AddTaskScreenInitial()) {
    on<AddTaskScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
