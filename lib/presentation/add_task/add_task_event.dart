import 'package:flutter/material.dart';

abstract class TaskEvent {}

class TaskTextChanged extends TaskEvent {
  final String title;
  final String description;
  final DateTime? date;
  final TimeOfDay? time;
  final bool isImportant;
  final String? category;
  final bool setReminder;

  TaskTextChanged({
    required this.title,
    required this.description,
    this.date,
    this.time,
    required this.isImportant,
    this.category,
    required this.setReminder,
  });
}
