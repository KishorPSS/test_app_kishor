import 'package:eschoolapp/widget_helper/constants.dart' as constants;
import 'package:eschoolapp/global_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/announcement_Model.dart';
import '../widget_helper/widgets_helper.dart';
import 'announc_detaile_screen.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constants;

class AnnouncementScreen extends StatefulWidget {
  final List<AnnouncementModel> announcementData;

  const AnnouncementScreen({super.key, required this.announcementData});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
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
            title: "Announcement",
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
                      'Latest Announcement',
                      style: const TextStyle(fontSize: 18),
                    )),
              ),
            ),
          )),
      body: widget.announcementData != []
          ? ListView.builder(
              itemCount: widget.announcementData.length,
              itemBuilder: (context, index) {
                return AnnouncementListItem(
                  description:
                      widget.announcementData[index].annDescription.toString(),
                  date: widget.announcementData[index].annDate.toString(),
                  event: widget.announcementData[index].annTitle.toString(),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class AnnouncementListItem extends StatelessWidget {
  final String date;
  final String event;
  final String description;

  const AnnouncementListItem(
      {super.key,
      required this.date,
      required this.event,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      top: 5,
      bottom: 5,
      colorBool: false,
      left: 10,
      right: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnnouncDetaileScreen(
                    event: event, date: date, description: description),
              ));
        },
        child: MyContainer(
          boxShadow: true,
          top: 10,
          right: 10,
          left: 10,
          bottom: 7,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MyTextSmall(
              title: date,
              color: HexColor("#0C6992"),
            ),
            const Gap(5),
            Text(
              event,
              maxLines: null,
              style: const TextStyle(fontSize: 17),
            ),
          ]),
        ),
      ),
    );
  }
}
