abstract class AddTaskScreenEvent {}

class OnTextChangeEvent extends AddTaskScreenEvent {
  final String title;
  OnTextChangeEvent(this.title);
}

class OnDescriptionChangeEvent extends AddTaskScreenEvent {
  final String description;
  OnDescriptionChangeEvent(this.description);
}

class OnToggleImportanceEvent extends AddTaskScreenEvent {
  final bool isImportant;
  OnToggleImportanceEvent(this.isImportant);
}

class OnToggleReminderEvent extends AddTaskScreenEvent {
  final bool isReminderSet;
  OnToggleReminderEvent(this.isReminderSet);
}

class OnCategoryChangeEvent extends AddTaskScreenEvent {
  final String category;
  OnCategoryChangeEvent(this.category);
}

class OnDatePickedEvent extends AddTaskScreenEvent {
  final String date;
  OnDatePickedEvent(this.date);
}

class OnTimePickedEvent extends AddTaskScreenEvent {
  final String time;
  OnTimePickedEvent(this.time);
}
