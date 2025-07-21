abstract class HomeEvent{}
class HomeTabChanged extends HomeEvent{
  final int selectedIndex;
  HomeTabChanged(this.selectedIndex);
}
class LoadTasks extends HomeEvent {}

class ToggleTaskStatus extends HomeEvent {
  final int taskIndex;

  ToggleTaskStatus(this.taskIndex);
}
class BottomNavBarChanged extends HomeEvent{
  final int selectedIndex;
  BottomNavBarChanged(this.selectedIndex);

}

