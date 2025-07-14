import 'package:flutter/material.dart';

class TaskCategory {
  final IconData icon;
  final String title;
  final int taskCount;
  final Color backgroundColor;

  TaskCategory({
    required this.icon,
    required this.title,
    required this.taskCount,
    required this.backgroundColor,
  });
}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<TaskCategory> categories;

  HomeLoaded({required this.categories});
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
