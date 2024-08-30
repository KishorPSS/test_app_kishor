import 'package:eschoolapp/global_helper.dart';
import 'package:flutter/material.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constants;
import 'package:table_calendar/table_calendar.dart';
import '../widget_helper/widgets_helper.dart';

class Holiday extends StatefulWidget {
  final String studentId;
  final String currentYear;
  const Holiday(
      {super.key, required this.studentId, required this.currentYear});

  @override
  State<Holiday> createState() => _HolidayState();
}

class _HolidayState extends State<Holiday> {
  @override
  void initState() {
    super.initState();
    // GlobalHelper().holiday(widget.studentId,widget.currentYear);
    // GlobalHelper().attendance(widget.studentId,widget.currentYear);
  }
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
            title: "Holiday",
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
                      'Student Holiday',
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ),
          )),
      body: Container(child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2024, 09, 1),
        focusedDay: DateTime.now(),
      ),),
    );
  }
}
