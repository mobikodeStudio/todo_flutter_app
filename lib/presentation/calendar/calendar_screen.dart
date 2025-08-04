// calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/presentation/calendar/widgets/dayheader.dart';
import 'bloc/calendar_bloc.dart';
import 'bloc/calendar_event.dart';
import 'bloc/calendar_state.dart';



class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  final List<String> months = const [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Month-Year Row with Arrows
              BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  if (state is CalendarLoadedState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_left, size: 28),
                          onPressed: () {
                            context.read<CalendarBloc>().add(PreviousMonthEvent());
                          },
                        ),
                        Text(
                          '${state.monthName} ${state.year}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_right, size: 28),
                          onPressed: () {
                            context.read<CalendarBloc>().add(NextMonthEvent());
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),

              const SizedBox(height: 24),

              // Weekday headers
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DayHeader("Sun"),
                  DayHeader("Mon"),
                  DayHeader("Tue"),
                  DayHeader("Wed"),
                  DayHeader("Thu"),
                  DayHeader("Fri"),
                  DayHeader("Sat"),
                ],
              ),

              const SizedBox(height: 16),


              BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  if (state is CalendarLoadedState) {
                    final firstDayOfMonth = DateTime(state.currentDate.year, state.currentDate.month, 1);
                    final daysInMonth = DateUtils.getDaysInMonth(state.currentDate.year, state.currentDate.month);
                    final startWeekday = firstDayOfMonth.weekday % 7;

                    final totalGridSlots = daysInMonth + startWeekday;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: totalGridSlots,
                      itemBuilder: (context, index) {
                        if (index < startWeekday) {
                          return const SizedBox();
                        }

                        final day = index - startWeekday + 1;
                        final date = DateTime(state.currentDate.year, state.currentDate.month, day);
                        final isSelected = state.selectedDate.day == date.day &&
                            state.selectedDate.month == date.month &&
                            state.selectedDate.year == date.year;


                        return GestureDetector(
                          onTap: () {
                            context.read<CalendarBloc>().add(SelectDateEvent(selectedDate: date));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$day',
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(height: 16),


              BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  if (state is CalendarLoadedState) {
                    return SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: months.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == state.currentDate.month - 1;
                          return GestureDetector(
                            onTap: () {
                              context.read<CalendarBloc>().add(SelectMonthEvent(monthIndex: index));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blue : Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  months[index],
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(height: 16),


              BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  if (state is CalendarLoadedState) {
                    final events = state.events[state.selectedDate] ?? [];

                    if (events.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "No Today's Event",
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Today's Events",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...events.map((event) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(event),
                          leading: const Icon(Icons.event),
                        )),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
