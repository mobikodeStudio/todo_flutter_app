import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc file
import 'package:todo_flutter_app/presentation/add_task/add_task_event.dart'; // Event file
import 'package:todo_flutter_app/presentation/add_task/add_task_state.dart';
import 'package:todo_flutter_app/presentation/add_task/add_task_bloc.dart'; // State file

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isImportant = false;
  String? selectedCategory;
  bool setReminder = false;

  void _onChanged() {
    context.read<TaskBloc>().add(
      TaskTextChanged(
        title: titleController.text,
        description: descriptionController.text,
        date: selectedDate,
        time: selectedTime,
        isImportant: isImportant,
        category: selectedCategory,
        setReminder: setReminder,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(_onChanged);
    descriptionController.addListener(_onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add New Task")),
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.blue)),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Task Title",
                hintText: "Enter task title here",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Description (Optional)",
                hintText: "Add task details",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Due Date And Time",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() => selectedDate = picked);
                        _onChanged();
                      }
                    },
                    child: Text(
                      selectedDate == null
                          ? "Select date"
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        setState(() => selectedTime = picked);
                        _onChanged();
                      }
                    },
                    child: Text(
                      selectedTime == null
                          ? "Select time"
                          : "${selectedTime!.hour}:${selectedTime!.minute}",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            SwitchListTile(
              value: isImportant,
              onChanged: (val) {
                setState(() => isImportant = val);
                _onChanged();
              },
              title: const Text(
                "Is this important?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Optional: make it slightly bigger
                ),
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Category",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              value: selectedCategory,
              items: ["Personal", "Work", "Health", "Shopping"].map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (val) {
                setState(() => selectedCategory = val);
                _onChanged();
              },
            ),

            const SizedBox(height: 8),
            SwitchListTile(
              value: setReminder,
              onChanged: (val) {
                setState(() => setReminder = val);
                _onChanged();
              },
              title: const Text(
                "Set Reminder",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // optional: makes it more readable
                ),
              ),
            ),

            const SizedBox(height: 20),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.isButtonEnabled
                      ? () {
                          // Save Task Logic
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    disabledBackgroundColor: Colors.blue.withOpacity(
                      0.5,
                    ), // Optional: greyed out when disabled
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Rounded corners like your design
                    ),
                    elevation: 0, // Flat style
                  ),
                  child: const Text(
                    "Create Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Make it strong and visible
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
