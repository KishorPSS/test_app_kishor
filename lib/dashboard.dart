import 'package:eschoolapp/global_helper.dart';
import 'package:eschoolapp/screen/announc_detaile_screen.dart';
import 'package:eschoolapp/screen/announcement_screen.dart';
import 'package:eschoolapp/screen/homework_screen.dart';
import 'package:eschoolapp/screen/online_exam_schedule.dart';
import 'package:eschoolapp/widget_helper/column_chart.dart';
import 'package:eschoolapp/widget_helper/drawer.dart';
import 'package:eschoolapp/notification/notification_icon.dart';
import 'package:eschoolapp/widget_helper/homework_slider_widget.dart';
import 'package:eschoolapp/widget_helper/line_chart.dart';
import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'widget_helper/constants.dart' as constants;
import 'models/announcement_Model.dart';
import 'models/homework_model.dart';

class DashBoard extends StatefulWidget {
  final Map<String, dynamic> onlineExamMarks;
  final String std;
  final String currentYear;
  final String studentId;
  final Map<String, dynamic> studentMap;
  const DashBoard(
      {super.key,
      required this.onlineExamMarks,
      required this.std,
      required this.currentYear,
      required this.studentId,
      required this.studentMap});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<AnnouncementModel> announcementData = [];
  List<HomeworkModel> homeworkData = [];

  @override
  void initState() {
    super.initState();
    initial();
    // checkInternet();
  }

  String? fullName;

  // List<dynamic> jsonData = [];
  // checkInternet() async {
  //   if (await constants.isInternet() == true) {
  //     initial();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Please connect to Internet')));
  //   }
  // }

  initial() async {
    // var prefer = await SharedPreferences.getInstance();

    // String? firstName = prefer.getString('name');
    // String? lastName = prefer.getString('surname');
    // String? firstName = studentMap!['txtStudentName'];
    // String? lastName =studentMap!['txtSurname'];
    // fullName = '$firstName $lastName';

    // announcement
    announcementData = (await GlobalHelper()
        .getAnnouncements(widget.studentId, widget.currentYear))!;
    // homework
    homeworkData = (await GlobalHelper()
        .getHomeworkData(widget.studentId, widget.currentYear))!;
    // student info
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constants.backgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Container(
              width: double.infinity,
              height: 115,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/content.png'), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Gap(7),
                        Builder(
                          builder: (context) {
                            return GestureDetector(
                              child: const MyLogo(
                                height: 60,
                                width: 60,
                              ),
                              onTap: () {
                                return Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),
                        const Gap(10),
                        const Text(
                          'Student Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    const NotificationIcon()
                  ],
                ),
              ),
            )),
        drawer: MyDrawer(
          studentMap: widget.studentMap,
          std: widget.std,
          homeworkModel: homeworkData,
          announcementData: announcementData,
          currentYear: widget.currentYear,
          fullName:
              "${widget.studentMap['txtStudentName']} ${widget.studentMap['txtSurname']}",
          studentId: widget.studentId,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              // IconButton(
              //     onPressed: () async {
              //       // Navigator.push(
              //       //     context,
              //       //     MaterialPageRoute(
              //       //       builder: (context) => LineChart(onlineExamMark: widget.onlineExamMarks,
              //       //           ),
              //       //
              //       //     ));
              //       // Navigator.push(context, MaterialPageRoute(builder: (context) => LineChart(),));
              //      print('Tabbed');
              //       await GlobalHelper().getHomeworkData(widget.studentId, widget.currentYear);
              //       // await GlobalHelper().onlineExamMarks(widget.studentId,widget.currentYear,widget.std);
              //       // print('widget.onlineExamMarks : ${widget.onlineExamMarks}');
              //       // print('onlineExamMark $onlineExamMark');
              //     },
              //     icon: const Icon(Icons.login)),
              MyContainer(
                  right: 15,
                  left: 15,
                  colorBool: false,
                  height: 100,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    IconListItem(
                      iconString: 'assets/announcment.png',
                      callback: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnnouncementScreen(
                                announcementData: announcementData),
                          )),
                      title: "Announcement",
                      // title: dashboardData?['txtStudentName'] ?? "",
                    ),
                    IconListItem(
                      iconString: 'assets/homwork.png',
                      callback: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeworkScreen(
                              homeworkData: homeworkData,
                            ),
                          )),
                      title: "Homework",
                    ),
                    IconListItem(
                      iconString: 'assets/online_exam.png',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnlineExamSchedule(
                                currentYear: widget.currentYear,
                                studentId: widget.studentId,
                              ),
                            ));
                      },
                      title: "Online Exams",
                    ),
                  ])),
              // 2
              announcementData.isEmpty
                  ? MyContainer(
                      left: 15,
                      right: 15,
                      topRadius: 0,
                      bottomRadius: 0,
                      colorBool: false,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          separatorBuilder: (context, index) {
                            return const Gap(10);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                padding: const EdgeInsets.all(5),
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image:
                                            AssetImage('assets/cardbgimg.png'),
                                        fit: BoxFit.cover)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/clipboard.png"),
                                        ],
                                      ),
                                    ]));
                          },
                        ),
                      ),
                    )
                  : MyContainer(
                      left: 15,
                      right: 15,
                      topRadius: 0,
                      bottomRadius: 0,
                      colorBool: false,
                      height: 75,
                      child: ListView.builder(
                        itemCount:
                            announcementData.getRange(0, 5).toList().length,
                        // .length > 10
                        // ? 10
                        // : announcementData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnnouncDetaileScreen(
                                        description: announcementData[index]
                                            .annDescription
                                            .toString(),
                                        date: announcementData[index]
                                            .annDate
                                            .toString(),
                                        event: announcementData[index]
                                            .annTitle
                                            .toString()),
                                  ));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                  padding: const EdgeInsets.only(top: 7, left: 7,right: 7,bottom: 5),
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/cardbgimg.png'),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset("assets/clipboard.png"),
                                            const Gap(4),
                                            Expanded(
                                              child: Text(
                                                maxLines: 2,
                                                announcementData[index]
                                                    .annTitle
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            )
                                          ],
                                        ),
                                        Align(alignment: Alignment.bottomRight,
                                          child: Text(
                                            announcementData[index]
                                                .annDate
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )
                                      ])),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      )),
              // 3
              // Gap(5),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    color: Colors.white),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    const HeaderRow(title: 'Online Exam Report'),

                    LineChart(onlineExamMark: widget.onlineExamMarks),
                  ],
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadiusDirectional.circular(15)),
              //   padding: const EdgeInsets.all(5),
              //   margin: const EdgeInsets.all(15),
              //   height: 300,
              //   child: SingleChildScrollView(
              //     primary: false,
              //     child: Column(children: [
              //       const HeaderRow(
              //         title: 'Online Test Report',
              //       ),
              //       const Gap(10),
              //       SingleChildScrollView(
              //           scrollDirection: Axis.horizontal,
              //           child: Row(
              //             children: [
              //              widget. onlineExamMarks.isEmpty
              //                   ? Container(height: 250, child: const SfCartesianChart(
              //                   isTransposed: true,
              //                   primaryXAxis: CategoryAxis(
              //                     axisLine: AxisLine(width: 1.5, color: Colors.black),
              //                     majorGridLines: MajorGridLines(width: 0),
              //                     majorTickLines: MajorTickLines(width: 0),
              //                     labelStyle: TextStyle(fontSize: 14, color: Colors.black),
              //                   ),
              //                   //
              //                   primaryYAxis: NumericAxis(
              //                     // placeLabelsNearAxisLine: true,
              //                     minimum: 0,
              //                     maximum: 100, isVisible: true,
              //                     interval: 25,
              //                     axisLine: AxisLine(width: 2),
              //                     minorGridLines: MinorGridLines(
              //                       width: 0,
              //                     ),
              //                     majorTickLines: MajorTickLines(width: 2),
              //                     minorTickLines: MinorTickLines(width: 0),
              //                     // majorGridLines: MajorGridLines(width: 2, color: Colors.black),
              //                     labelStyle: TextStyle(fontSize: 15, color: Colors.black),
              //                     // labelFormat: ,
              //                     // numberFormat: ,
              //                   ),
              //
              //                 ),)
              //                   :
              //              ColumnChart(
              //                       onlineExamMarks:widget. onlineExamMarks,
              //                     ),
              //               const Gap(10)
              //             ],
              //           )),
              //       const Gap(10),
              //     ]),
              //   ),
              // ),

              // 4

              homeworkData.isEmpty
                  ? MyContainer(
                      top: 5,
                      colorBool: false,
                      left: 15,
                      right: 15,
                      bottom: 15,
                      height: 370,
                      boxShadow: true,
                      child: MyContainer(
                        boxShadow: true,
                        child: Column(children: [
                          HeaderRow(
                              title: 'Latest Homework',
                              subTitle: InkWell(
                                onTap: () {
                                  print('tabbed');
                                },
                                child: MyTextMini(
                                  title: "View All",
                                  color: HexColor("#8A8B8E"),
                                ),
                              )),
                          Container(
                            height: 300,
                          )
                        ]),
                      ))
                  : HomeworkSliderWidget(
                      homeworkModel: homeworkData,
                      firstList: homeworkData.getRange(0, 3).toList(),
                      secondList: homeworkData.getRange(3, 6).toList(),
                    )
            ]),
          ),
        ));
  }
}
