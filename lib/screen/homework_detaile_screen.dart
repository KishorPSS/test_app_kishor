import 'package:eschoolapp/models/homework_model.dart';
import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeworkDetaileScreen extends StatelessWidget {
  final HomeworkModel? homeworkModel;
  final String? createdAt;
  final String? dueAt;
  final String? subject;
  final String? description;
  final String? question;

  const HomeworkDetaileScreen(
      {super.key,
      this.createdAt,
      this.subject,
      this.description,
      this.dueAt,
      this.question,
      this.homeworkModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        body: Stack(
          children: [
            Container(),
            const ContainerAppBar(
              title: "Homework",
              containerHeight: 140,
            ),
            Positioned(
                top: 110,
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            color: HexColor('#0C6992'),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                description !,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: [
                              Text(
                                question!,
                                style: const TextStyle(fontSize: 17),
                              ),
                              const Gap(30),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  subject!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor('#0B6D8D'),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Assigned at $createdAt",
                                        style: TextStyle(
                                            color: HexColor('#0B6D8D'))),
                                    Text("Due To $dueAt",
                                        style: TextStyle(
                                            color: HexColor('#0B6D8D'))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
