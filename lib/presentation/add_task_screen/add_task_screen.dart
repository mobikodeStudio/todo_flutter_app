import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/common_consts.dart';
import '../widgets/to_do_dropdown_button.dart';
import '../widgets/to_do_due_date_time.dart';
import '../widgets/to_do_primary_button.dart';
import '../widgets/to_do_switch_list_tile.dart';
import '../widgets/to_do_text.dart';
import '../widgets/to_do_text_field.dart';
import 'bloc/add_task_screen_bloc.dart';
import 'bloc/add_task_screen_event.dart';
import 'bloc/add_task_screen_state.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: ToDoText(
            label: 'Add New Task',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Title
              BlocListener<AddTaskScreenBloc, AddTaskScreenState>(
                listenWhen: (previous, current) =>
                    current is AddTaskScreenTextChanged,
                listener: (context, state) {
                  if (state is AddTaskScreenTextChanged) {
                    taskController.text = state.taskTitle;
                    taskController.selection = TextSelection.fromPosition(
                      TextPosition(offset: taskController.text.length),
                    );
                  }
                },
                child: ToDoTextField(
                  controller: taskController,
                  textLabel: 'Task Title',
                  textHintLabel: 'Enter task title',
                  isSuffixIconVisible: false,
                  onChanged: (value) {
                    context.read<AddTaskScreenBloc>().add(
                      OnTextChangeEvent(value),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              // Description
              BlocListener<AddTaskScreenBloc, AddTaskScreenState>(
                listenWhen: (previous, current) =>
                    current is AddTaskScreenDescriptionChanged,
                listener: (context, state) {
                  if (state is AddTaskScreenDescriptionChanged) {
                    descriptionController.text = state.descriptionTitle;
                    descriptionController
                        .selection = TextSelection.fromPosition(
                      TextPosition(offset: descriptionController.text.length),
                    );
                  }
                },
                child: ToDoTextField(
                  controller: descriptionController,
                  textLabel: 'Description (Optional)',
                  textHintLabel: 'Add Task Details',
                  maxLine: 3,
                  isSuffixIconVisible: false,
                  onChanged: (value) {
                    context.read<AddTaskScreenBloc>().add(
                      OnDescriptionChangeEvent(value),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              // Due Date & Time
              BlocBuilder<AddTaskScreenBloc, AddTaskScreenState>(
                buildWhen: (previous, current) =>
                    current is AddTaskDueDateTimeState,
                builder: (context, state) {
                  final selectedDate = state is AddTaskDueDateTimeState
                      ? state.selectedDate
                      : null;
                  final selectedTime = state is AddTaskDueDateTimeState
                      ? state.selectedTime
                      : null;

                  return DueDateTimeTile(
                    selectedDate: selectedDate,
                    selectedTime: selectedTime,
                    onDateTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        final formattedDate =
                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        context.read<AddTaskScreenBloc>().add(
                          OnDatePickedEvent(formattedDate),
                        );
                      }
                    },
                    onTimeTap: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        final formattedTime = pickedTime.format(context);
                        context.read<AddTaskScreenBloc>().add(
                          OnTimePickedEvent(formattedTime),
                        );
                      }
                    },
                  );
                },
              ),

              const SizedBox(height: 25),

              // Importance Switch
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Is this important?",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: BlocBuilder<AddTaskScreenBloc, AddTaskScreenState>(
                  buildWhen: (previous, current) =>
                      current is AddTaskImportanceState,
                  builder: (context, state) {
                    final isImportant = state is AddTaskImportanceState
                        ? state.isImportant
                        : false;
                    return ToDoSwitchTile(
                      title: isImportant ? 'Yes' : 'No',
                      value: isImportant,
                      onChanged: (val) {
                        context.read<AddTaskScreenBloc>().add(
                          OnToggleImportanceEvent(val),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              // Category Dropdown
              BlocBuilder<AddTaskScreenBloc, AddTaskScreenState>(
                buildWhen: (previous, current) =>
                    current is AddTaskCategoryState,
                builder: (context, state) {
                  final selectedCategory = state is AddTaskCategoryState
                      ? state.selectedCategory
                      : categoryOptions.first;
                  return ToDoDropdown(
                    title: 'Category',
                    selectedValue: selectedCategory,
                    options: categoryOptions,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<AddTaskScreenBloc>().add(
                          OnCategoryChangeEvent(value),
                        );
                      }
                    },
                  );
                },
              ),

              const SizedBox(height: 25),

              // Reminder Switch
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: BlocBuilder<AddTaskScreenBloc, AddTaskScreenState>(
                  buildWhen: (previous, current) =>
                      current is AddTaskReminderState,
                  builder: (context, state) {
                    final isReminderSet = state is AddTaskReminderState
                        ? state.isReminderSet
                        : false;
                    return ToDoSwitchTile(
                      title: 'Set Reminder',
                      value: isReminderSet,
                      onChanged: (val) {
                        context.read<AddTaskScreenBloc>().add(
                          OnToggleReminderEvent(val),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              ToDoPrimaryButton(
                label: 'Create Task',
                onPressed: () {
                  final taskTitle = taskController.text;
                  final description = descriptionController.text;
                  print("Creating Task: $taskTitle - $description");
                  // Add any logic or Bloc event dispatch here if needed
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
