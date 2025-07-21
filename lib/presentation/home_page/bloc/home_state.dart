abstract class HomeState {}

class HomeInitialState extends HomeState {
  final int selectedIndex;

  HomeInitialState({required this.selectedIndex});
}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final int selectedIndex;
  final List<Map<String, dynamic>> tasks;
  final int bottomNavIndex;

  HomeLoadedState({
    required this.selectedIndex,
    required this.tasks,
    required this.bottomNavIndex,
  });
}