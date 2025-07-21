abstract class AddTaskScreenState {}

class AddTaskScreenInitial extends AddTaskScreenState {}

class AddTaskScreenTextChanged extends AddTaskScreenState {
  final String taskTitle;
  AddTaskScreenTextChanged(this.taskTitle);
}

class AddTaskScreenDescriptionChanged extends AddTaskScreenState {
  final String descriptionTitle;
  AddTaskScreenDescriptionChanged(this.descriptionTitle);
}

class AddTaskImportanceState extends AddTaskScreenState {
  final bool isImportant;
  AddTaskImportanceState(this.isImportant);
}

class AddTaskReminderState extends AddTaskScreenState {
  final bool isReminderSet;
  AddTaskReminderState(this.isReminderSet);
}

class AddTaskCategoryState extends AddTaskScreenState {
  final String selectedCategory;
  AddTaskCategoryState(this.selectedCategory);
}

class AddTaskDueDateTimeState extends AddTaskScreenState {
  final String? selectedDate;
  final String? selectedTime;

  AddTaskDueDateTimeState({this.selectedDate, this.selectedTime});
}
