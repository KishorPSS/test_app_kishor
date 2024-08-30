import 'dart:developer';

import 'package:eschoolapp/global_helper.dart';
import 'package:flutter/material.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constants;
import 'package:table_calendar/table_calendar.dart';
import '../widget_helper/widgets_helper.dart';

class StudentAttendance extends StatefulWidget {
  final String studentId;
  final String currentYear;
  final int startingYear;
  const StudentAttendance(
      {super.key,
      required this.studentId,
      required this.currentYear,
      required this.startingYear});

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  List absentDays = [];
  List holidayDate = [];
  List holidayDescription = [];

  int absentDaysCount = 0;

  CalendarFormat formatM = CalendarFormat.month;
  DateTime today = DateTime.now();
  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    print(widget.startingYear);
    var attendance =
        await GlobalHelper().attendance(widget.studentId, widget.currentYear);
    absentDaysCount = int.parse(attendance['count_of_absent_days'].toString());
    absentDays = attendance['absent_days'];
    // print(attendance.runtimeType);
    print(absentDays.toString());
    // print(absentDaysCount.toString());
    // ------------
    // var holiday =await GlobalHelper().holiday(widget.studentId, widget.currentYear);
    // holidayDate = holiday['all_holidays'];
    // holidayDescription = holiday['all_holidays']['holiday_description'];
// log(holiday.toString());
//     print('kishor');

// log(holiday['all_holidays'].toString());
//     print(holiday.runtimeType);
    // print(holidayDate.toString());
    // print(holidayDescription.toString());
  }

  List<DateTime> date = [
    DateTime(2024, 6, 22),
    DateTime(2024, 6, 28),
    DateTime(2024, 6, 29),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.backgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170),
          child: MyAppBar(
            leading: MyTextButton(
              myWidget: const Icon(Icons.arrow_back_ios, color: Colors.white),
              callback: () {
                Navigator.pop(context);
              },
            ),
            title: "Attendance",
            containerHeight: 160,
            between: Positioned(
              bottom: -20,
              left: 25,
              right: 25,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 45,
                child: const Center(
                    child: Text(
                  'Student Attendance',
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
          )),
      body: Container(
        child: TableCalendar(
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
                for (DateTime d in date) {
                if (day.day == d.day &&
                    day.month == d.month &&
                    day.year == d.year) {
                  return Container(height: 40,width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  );
                }
          //       // else{
          //       //   return Container(height: 40,width: 40,
          //       //     decoration: const BoxDecoration(
          //       //       color: Colors.transparent,
          //       //       borderRadius: BorderRadius.all(
          //       //         Radius.circular(60),
          //       //       ),
          //       //     ),
          //       //     child: Center(
          //       //       child: Text(
          //       //         '${day.day}',
          //       //         style: const TextStyle(fontSize: 15, color: Colors.white),
          //       //       ),
          //       //     ),
          //       //   );
          //       // }
              }
              return null;
            },
          ),
          firstDay: DateTime.utc(widget.startingYear, 6, 15),
          lastDay: DateTime.now(),
          focusedDay: today,
          calendarFormat: CalendarFormat.month,
          selectedDayPredicate: (day) => isSameDay(day, today),

          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              today = selectedDay;
            });
          },

          calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              )),
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},

          onFormatChanged: (format) {
            formatM = format;
          },
        ),
      ),
    );
  }
}
