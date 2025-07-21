import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Map<String, dynamic>> _tasks = [
  {
  'title': 'Team meeting',
  'time': '10:00 AM',
  'isCompleted': true,
  'isImportant': true,
},
{
'title': 'Project deadline',
'time': '2:00 PM',
'isCompleted': true,
'isImportant': true,
},
{
'title': 'Grocery shopping',
'time': '4:00 PM',
'isCompleted': false,
'isImportant': false,
},
    {
      'title': 'Workout session',
      'time': '6:00 PM',
      'isCompleted': false,
      'isImportant': false,
    },
  ];

  HomeBloc() : super(HomeLoadingState()) {
    on<HomeTabChanged>((event, emit) async {
      emit(HomeLoadingState());

      await Future.delayed(const Duration(milliseconds: 200));

      emit(HomeLoadedState(
        selectedIndex: event.selectedIndex,
        tasks: List.from(_tasks),
        bottomNavIndex: state is HomeLoadedState ? (state as HomeLoadedState).bottomNavIndex : 0,
      ));
    });

    on<ToggleTaskStatus>((event, emit) {
      _tasks[event.taskIndex]['isCompleted'] =
      !_tasks[event.taskIndex]['isCompleted'];
      emit(HomeLoadedState(
        selectedIndex: state is HomeLoadedState
            ? (state as HomeLoadedState).selectedIndex
            : 0,
        tasks: List.from(_tasks),
        bottomNavIndex: state is HomeLoadedState ? (state as HomeLoadedState).bottomNavIndex : 0,
      ));
    });

    // Optional: load default tab
    add(HomeTabChanged(0));
    on<BottomNavBarChanged>((event, emit) {
      if (state is HomeLoadedState) {
        final currentState = state as HomeLoadedState;
        emit(HomeLoadedState(
          selectedIndex: currentState.selectedIndex,
          tasks: List.from(_tasks),
          bottomNavIndex: event.selectedIndex,
        ));
      }
    });
  }
}

