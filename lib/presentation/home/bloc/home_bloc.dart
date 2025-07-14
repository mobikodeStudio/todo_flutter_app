import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadTaskCategories>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(Duration(seconds: 1)); // Simulate loading
      emit(HomeLoaded(categories: [
        TaskCategory(
          icon: Icons.person,
          title: 'Personal',
          taskCount: 5,
          backgroundColor: Colors.purple,
        ),
        TaskCategory(
          icon: Icons.work,
          title: 'Work',
          taskCount: 8,
          backgroundColor: Colors.blue,
        ),
        TaskCategory(
          icon: Icons.shopping_cart,
          title: 'Shopping',
          taskCount: 3,
          backgroundColor: Colors.orange,
        ),
        TaskCategory(
          icon: Icons.favorite,
          title: 'Health',
          taskCount: 4,
          backgroundColor: Colors.red,
        ),
      ]));
    });
  }
}
