import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Custom imports based on your folder structure
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'widgets/task_category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadTaskCategories()),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Tasks",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterButton("Today", isSelected: true),
                      filterButton("Important"),
                      filterButton("Upcoming"),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// BlocBuilder for Task Categories
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is HomeLoaded) {
                        final cardWidth = (MediaQuery.of(context).size.width - 52) / 2;
                        return Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: state.categories.map((category) {
                            return SizedBox(
                              width: cardWidth,
                              child: TaskCategoryCard(
                                icon: category.icon,
                                title: category.title,
                                taskCount: category.taskCount,
                                backgroundColor: category.backgroundColor,
                              ),
                            );
                          }).toList(),
                        );
                      } else if (state is HomeError) {
                        return Text(state.message, style: const TextStyle(color: Colors.red));
                      }
                      return const SizedBox.shrink();
                    },
                  ),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Today's Tasks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("4/6 completed", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  taskTile("Team meeting", "10:00 AM", completed: true),
                  taskTile("Project deadline", "2:00 PM", completed: true),
                  taskTile("Grocery shopping", "4:00 PM"),
                  taskTile("Workout session", "6:00 PM"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔽 Custom button widget for filter
  Widget filterButton(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔽 Custom task tile widget
  Widget taskTile(String title, String time, {bool completed = false}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        completed ? Icons.check_circle : Icons.radio_button_unchecked,
        color: completed ? Colors.blue : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          decoration: completed ? TextDecoration.lineThrough : null,
          color: completed ? Colors.grey : Colors.black,
        ),
      ),
      subtitle: Text(time),
      trailing: const Icon(Icons.star_border, color: Colors.grey),
    );
  }
}
