import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<Map<String, dynamic>> _allTasks = [
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

  int _selectedIndex = 0;
  int _bottomNavIndex = 0;

  HomeBloc() : super(HomeLoadedState(selectedIndex: 0, tasks: [], bottomNavIndex: 0)) {
    on<HomeInitialEvent>(_onInitialLoad);
    on<HomeTabChanged>(_onTabChanged);
    on<ToggleTaskStatus>(_onToggleTaskStatus);
    on<BottomNavBarChanged>(_onBottomNavBarChanged);

    add(HomeInitialEvent(selectedIndex: _selectedIndex));
  }

  List<Map<String, dynamic>> _filterTasks(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return _allTasks.where((task) => true).toList(); // Today
      case 1:
        return _allTasks.where((task) => task['isImportant'] == true).toList();
      case 2:
        return _allTasks.where((task) => task['isCompleted'] == false).toList(); // Upcoming
      default:
        return _allTasks;
    }
  }

  FutureOr<void> _onInitialLoad(
      HomeInitialEvent event,
      Emitter<HomeState> emit,
      ) {
    _selectedIndex = event.selectedIndex;
    emit(HomeLoadedState(
      selectedIndex: _selectedIndex,
      tasks: _filterTasks(_selectedIndex),
      bottomNavIndex: _bottomNavIndex,
    ));
  }

  FutureOr<void> _onTabChanged(
      HomeTabChanged event,
      Emitter<HomeState> emit,
      ) {
    _selectedIndex = event.selectedIndex;
    emit(HomeLoadedState(
      selectedIndex: _selectedIndex,
      tasks: _filterTasks(_selectedIndex),
      bottomNavIndex: _bottomNavIndex,
    ));
  }

  FutureOr<void> _onToggleTaskStatus(
      ToggleTaskStatus event,
      Emitter<HomeState> emit,
      ) {
    _allTasks[event.taskIndex]['isCompleted'] =
    !_allTasks[event.taskIndex]['isCompleted'];
    emit(HomeLoadedState(
      selectedIndex: _selectedIndex,
      tasks: _filterTasks(_selectedIndex),
      bottomNavIndex: _bottomNavIndex,
    ));
  }

  FutureOr<void> _onBottomNavBarChanged(
      BottomNavBarChanged event,
      Emitter<HomeState> emit,
      ) {
    _bottomNavIndex = event.selectedIndex;
    emit(HomeLoadedState(
      selectedIndex: _selectedIndex,
      tasks: _filterTasks(_selectedIndex),
      bottomNavIndex: _bottomNavIndex,
    ));
  }
}
