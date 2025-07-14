class TaskState {
  final bool isButtonEnabled;

  TaskState({required this.isButtonEnabled});
  factory TaskState.initial() {
    return TaskState(isButtonEnabled: false);
  }

  TaskState copyWith({bool? isButtonEnabled}) {
    return TaskState(isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled);
  }
}
