import 'package:eschoolapp/models/student_model.dart';
import 'package:eschoolapp/screen/attendenc.dart';
import 'package:eschoolapp/screen/holiday.dart';
import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_helper.dart';
import '../in_up_out/log_in_screen.dart';
import '../models/announcement_Model.dart';
import '../models/homework_model.dart';
import '../screen/announcement_screen.dart';
import '../screen/fees_history_screen.dart';
import '../screen/homework_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/feedback_form.dart';

class MyDrawer extends StatefulWidget {
  final List<AnnouncementModel>? announcementData;

  final String? fullName;
  final String? currentYear;
  final String? studentId;
  final String? std;
  final Map<String, dynamic>? studentMap;
  final List<HomeworkModel>? homeworkModel;
  const MyDrawer(
      {super.key,
      this.fullName,
      this.studentId,
      this.currentYear,
      this.announcementData,
      required this.homeworkModel,
      required this.std,
      this.studentMap});
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              const Gap(40),
              InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                    if (widget.studentMap!.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              std: widget.std!,
                              studentMap: widget.studentMap,
                              studentId: widget.studentId.toString(),
                            ),
                          ));
                    }
                  },
                  child: ListTile(
                      leading: widget.studentMap!['profile_pic'] != null
                          ? Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.studentMap!['profile_pic']))))
                          : const Icon(Icons.person),
                      subtitle:
                          MyTextSmall(title: "Student ID: ${widget.studentId}"),
                      title: MyTextSmall(
                        color: Colors.black,
                        title: widget.fullName.toString(),
                      ))),
              const Gap(20),
              DrawerMenu(
                  callback: () async {
                    Navigator.pop(context);
                  },
                  title: "Dashboard",
                  iconData: Icons.dashboard_outlined,
                  tileColor: "#0C6992",
                  myColors: Colors.white,
                  myIconColors: Colors.white),
              DrawerMenu(
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnnouncementScreen(
                            announcementData: widget.announcementData!),
                      ));
                },
                title: "Announcement",
                iconData: Icons.library_books,
              ),
              DrawerMenu(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeworkScreen(
                            homeworkData: widget.homeworkModel!,
                          ),
                        ));
                  },
                  title: "Homework",
                  iconData: Icons.menu_book_sharp),
              DrawerMenu(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackForm(
                              std: widget.std!,
                              studentId: widget.studentId.toString()),
                        ));
                  },
                  title: "Feedback",
                  iconData: Icons.feedback),
              DrawerMenu(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeesHistoryScreen(
                              studentMap: widget.studentMap!,
                              currentYear: widget.currentYear.toString(),
                              studentId: widget.studentId.toString()),
                        ));
                  },
                  title: "Payment History",
                  // title: "Fees",
                  iconData: Icons.account_balance_wallet),
              DrawerMenu(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentAttendance(
                              startingYear: int.parse(widget.currentYear
                                  .toString()
                                  .substring(0, 4)),
                              currentYear: widget.currentYear.toString(),
                              studentId: widget.studentId.toString()),
                        ));
                  },
                  title: "Attendance",
                  // title: "Fees",
                  iconData: Icons.co_present),
              DrawerMenu(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Holiday(
                              currentYear: widget.currentYear.toString(),
                              studentId: widget.studentId.toString()),
                        ));
                  },
                  title: "Holiday",
                  // title: "Fees",
                  iconData: Icons.co_present),
            ]),
            DrawerMenu(
              callback: () async {
                var prefer = await SharedPreferences.getInstance();
                await prefer.setBool('isLogin', false);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                  (route) => false,
                );
              },
              title: "Sign Out",
              iconData: Icons.backspace_outlined,
              myIconColors: Colors.red,
              myColors: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? tileColor;
  final IconData iconData;
  final Color? myColors;
  final Color? myIconColors;
  final VoidCallback? callback;

  const DrawerMenu(
      {super.key,
      required this.title,
      required this.iconData,
      this.subtitle,
      this.tileColor,
      this.myColors = Colors.black,
      this.myIconColors = Colors.black,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (callback != null) {
          callback!();
        }
      },
      child: ListTile(
          tileColor: tileColor != null ? HexColor(tileColor!) : null,
          leading: Icon(iconData, color: myIconColors),
          title: MyTextMedium(
            title: title,
            color: myColors!,
          )),
    );
  }
}
