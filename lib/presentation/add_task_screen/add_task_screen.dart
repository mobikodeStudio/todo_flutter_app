import 'package:flutter/material.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_primary_button.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_switch_list_tile.dart';
import '../widgets/to_do_text.dart';
import '../widgets/to_do_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController importantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.blue)),
        ),
        title: Center(
          child: ToDoText(
            label: 'Add New Task',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ToDoTextField(
              controller: taskController,
              textLabel: 'Task Title',
              textHintLabel: 'Enter task title',
              isSuffixIconVisible: true,
              suffixIcon: Icons.clear,
              suffixOnClick: () => taskController.clear(),
            ),
            const SizedBox(height: 10),
            ToDoTextField(
              controller: descriptionController,
              textLabel: 'Description (Optional)',
              textHintLabel: 'Add Task Details',
              isSuffixIconVisible: true,
              suffixIcon: Icons.clear,
              suffixOnClick: () => taskController.clear(),
            ),
            const SizedBox(height: 20),
            ToDoText(
              label: 'Due Date & Time',
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            const SizedBox(height: 40),
            ToDoTextField(
              controller: importantController,
              textLabel: 'Is this Important ',
              textHintLabel: 'No',
            ),
            const SizedBox(height: 20),
            // ToDoSwitchTile(title: 'Set Remainder', value: , onChanged: onChanged),
            const SizedBox(height: 20),
            // ToDoPrimaryButton(label: 'Create Task', onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
