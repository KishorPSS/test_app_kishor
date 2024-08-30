import 'package:eschoolapp/global_helper.dart';
import 'package:eschoolapp/models/online_exam_schedule_model.dart';
import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constants;
import 'package:gap/gap.dart';

class OnlineExamSchedule extends StatefulWidget {
  final String studentId;
  final String currentYear;
  const OnlineExamSchedule(
      {super.key, required this.studentId, required this.currentYear});

  @override
  State<OnlineExamSchedule> createState() => _OnlineExamScheduleState();
}

class _OnlineExamScheduleState extends State<OnlineExamSchedule> {
  List<ExamScheduleModel>? examScheduleModel;
  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    // 42678
    examScheduleModel = (await GlobalHelper()
        .onlineExamSchedule(widget.studentId, widget.currentYear))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.backgroundColor,
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: MyAppBar(
            leading: MyTextButton(
              myWidget: const Icon(Icons.arrow_back_ios, color: Colors.white),
              callback: () {
                Navigator.pop(context);
              },
            ),
            title: "Online Exam Schedule",
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
                child: Center(
                    child: Text(
                      'Latest Online Exam Schedule',
                      style: const TextStyle(fontSize: 18),
                    )),
              ),
            ),
          )),
      body: examScheduleModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : examScheduleModel!.isEmpty
              ? const Center(
                  child: Text('No Exam Scheduled Yet'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: examScheduleModel!.length,
                  itemBuilder: (context, index) {
                    var schedule = examScheduleModel?[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  constants.dateToDate(
                                      schedule!.startDateTime.toString()),
                                  style: TextStyle(
                                      fontSize: 16, color: constants.blushText),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Icon(Icons.circle,
                                      color: Colors.blueAccent, size: 10),
                                ),
                                Text(
                                    '${constants.dateToTime(schedule.startDateTime.toString())}-${constants.dateToTime(schedule.endDateTime.toString())}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: constants.blushText)),
                              ],
                            ),
                            const Gap(7),
                            Text(
                              maxLines: null,
                              schedule.examName.toString().trim(),
                              style: const TextStyle(fontSize: 17),
                            ),
                            const Gap(4),
                            Text(
                                maxLines: null,
                                schedule.examDescription.trim()),
                            const Gap(5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '- By ${schedule.addedBy.toString()}',
                                  style: TextStyle(
                                      color: constants.blushText, fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
