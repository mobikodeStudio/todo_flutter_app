import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/presentation/home_page/widgets/task_category_card.dart';
import 'package:todo_flutter_app/presentation/home_page/widgets/tabbutton.dart';
import '../home_page/bloc/home_bloc.dart';
import '../home_page/bloc/home_event.dart';
import '../home_page/bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "My Tasks",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 24),

                // BlocBuilder for Tabs
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    int selectedIndex = 0;
                    if (state is HomeInitialState) {
                      selectedIndex = state.selectedIndex;
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TabButton(
                          text: 'Today',
                          isSelected: selectedIndex == 0,
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(HomeTabChanged(0));
                          },
                        ),
                        TabButton(
                          text: 'Important',
                          isSelected: selectedIndex == 1,
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(HomeTabChanged(1));
                          },
                        ),
                        TabButton(
                          text: 'Upcoming',
                          isSelected: selectedIndex == 2,
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(HomeTabChanged(2));
                          },
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 32),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TaskCategoryCard(
                      title: 'Personal',
                      taskCount: '5Tasks',
                      icon: Icons.person,
                      backgroundColor: Colors.orange,
                    ),
                    TaskCategoryCard(
                      title: 'Work',
                      taskCount: '3Tasks',
                      icon: Icons.work,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TaskCategoryCard(
                      title: 'Shopping',
                      taskCount: '8Tasks',
                      icon: Icons.shopping_cart,
                      backgroundColor: Colors.green,
                    ),
                    TaskCategoryCard(
                      title: 'Health',
                      taskCount: '2Tasks',
                      icon: Icons.favorite,
                      backgroundColor: Colors.red,
                    ),

                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                 child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadedState) {
                      final tasks = state.tasks;

                      return ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return ListTile(
                            title: Text(
                              task['title'],
                              style: TextStyle(
                                decoration: task['isCompleted']
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: task['isCompleted'] ? Colors.grey : Colors.black,
                              ),
                            ),
                            subtitle: Text(task['time']),
                            trailing: task['isImportant']
                                ? const Icon(Icons.star, color: Colors.blue)
                                : null,
                            onTap: () {
                              context.read<HomeBloc>().add(ToggleTaskStatus( index));
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            int selectedIndex = 0;
            if (state is HomeLoadedState) {
              selectedIndex = state.bottomNavIndex;
            }

            return BottomNavigationBar(
              currentIndex: selectedIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                context.read<HomeBloc>().add(BottomNavBarChanged(index));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_box_outlined),
                  label: 'Task',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.analytics_outlined),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            );
          },
        ),
        //
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your navigation to AddTaskScreen here
          },
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

