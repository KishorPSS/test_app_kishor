import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widget_helper/widgets_helper.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constants;

class AnnouncDetaileScreen extends StatelessWidget {
  final String description;
  final String date;
  final String event;
  const AnnouncDetaileScreen({
    super.key,
    required this.description,
    required this.date,
    required this.event,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constants.backgroundColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(),
            const ContainerAppBar(
              title: 'Announcement',
              containerHeight: 135,
            ),
            Positioned(
                top: 100,
                bottom: 20,
                right: 20,
                left: 20,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: HexColor('#0C6992'),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            event,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          primary: true,
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    description,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  const Gap(20)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
