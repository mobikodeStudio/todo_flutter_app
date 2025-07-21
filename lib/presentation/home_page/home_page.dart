import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/add_task_screen/add_task_screen.dart';
import 'package:todo_flutter_app/presentation/add_task_screen/bloc/add_task_screen_bloc.dart';
import 'package:todo_flutter_app/presentation/home_page/bloc/home_bloc.dart';
import 'package:todo_flutter_app/presentation/home_page/bloc/home_event.dart';
import 'package:todo_flutter_app/presentation/home_page/bloc/home_state.dart';
import 'package:todo_flutter_app/presentation/home_page/widgets/tabbutton.dart';
import 'package:todo_flutter_app/presentation/home_page/widgets/task_category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "My Tasks",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              /// Tabs Section
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final selectedIndex = (state is HomeLoadedState)
                      ? state.selectedIndex
                      : 0;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
                      final titles = ['Today', 'Important', 'Upcoming'];
                      return TabButton(
                        text: titles[index],
                        isSelected: selectedIndex == index,
                        onTap: () =>
                            context.read<HomeBloc>().add(HomeTabChanged(index)),
                      );
                    }),
                  );
                },
              ),
              const SizedBox(height: 32),

              /// Task Category Cards (as Grid)
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 2,
                children: const [
                  TaskCategoryCard(
                    title: 'Personal',
                    taskCount: '5 Tasks',
                    icon: Icons.person,
                    backgroundColor: Colors.orange,
                  ),
                  TaskCategoryCard(
                    title: 'Work',
                    taskCount: '3 Tasks',
                    icon: Icons.work,
                    backgroundColor: Colors.blue,
                  ),
                  TaskCategoryCard(
                    title: 'Shopping',
                    taskCount: '8 Tasks',
                    icon: Icons.shopping_cart,
                    backgroundColor: Colors.green,
                  ),
                  TaskCategoryCard(
                    title: 'Health',
                    taskCount: '2 Tasks',
                    icon: Icons.favorite,
                    backgroundColor: Colors.red,
                  ),
                ],

              ),

              const SizedBox(height: 20),

              /// Tasks List
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadedState) {
                    final tasks = state.tasks;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                              color: task['isCompleted']
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          subtitle: Text(task['time']),
                          trailing: task['isImportant']
                              ? const Icon(Icons.star, color: Colors.blue)
                              : null,
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final selectedIndex = (state is HomeLoadedState)
              ? state.bottomNavIndex
              : 0;

          return BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) =>
                context.read<HomeBloc>().add(BottomNavBarChanged(index)),
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

      /// Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (_) => getIt<AddTaskScreenBloc>(),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
