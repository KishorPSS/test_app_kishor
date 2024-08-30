import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../models/homework_model.dart';
import '../widget_helper/widgets_helper.dart';
import 'homework_detaile_screen.dart';
import 'package:eschoolapp/widget_helper/constants.dart'as constants;

class HomeworkScreen extends StatefulWidget {
  final List<HomeworkModel> homeworkData;
  const HomeworkScreen({
    super.key,
    required this.homeworkData,
  });
  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {

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
            title: "Homework",
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
                  'Latest Homework',
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: widget.homeworkData != []
            ? ListView.builder(
                itemCount: widget.homeworkData.length,
                itemBuilder: (context, index) {
                  return HomeworkItemWidget(
                    homeworkModel: widget.homeworkData[index],
                    createdAt: widget.homeworkData[index].createdAt != null
                        ? widget.homeworkData[index].createdAt.toString() ==
                                DateFormat('MMM d, y')
                                    .format(DateTime.now())
                                    .toString()
                            ? "Today"
                            : widget.homeworkData[index].createdAt.toString()
                        : '',
                    dueAt: widget.homeworkData[index].dueDate.toString(),
                    description: widget.homeworkData[index].description
                        .toString()
                        .trim(),
                    subject: widget.homeworkData[index].subjectName.toString(),
                    question:
                        widget.homeworkData[index].question.toString().trim(),
                  );
                },
              )
            : Container(
                color: Colors.red,
                child: const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}

class HomeworkItemWidget extends StatelessWidget {
  final HomeworkModel homeworkModel;
  final String createdAt;
  final String dueAt;
  final String subject;
  final String description;
  final String question;

  const HomeworkItemWidget({
    super.key,
    required this.createdAt,
    required this.subject,
    required this.description,
    required this.dueAt,
    required this.question,
    required this.homeworkModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeworkDetaileScreen(
                  createdAt: createdAt,
                  subject: subject,
                  description: description.trim(),
                  dueAt: dueAt,
                  question: question.trim()),
            )),
        child: MyContainer(
          top: 9,
          right: 10,
          left: 10,
          bottom: 9,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                createdAt,
                style: TextStyle(fontSize: 15, color: HexColor("#0B6D8D")),
              ),
              const Gap(5),
              Text(
                maxLines: 3,
                question,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subject,
                    style: TextStyle(color: HexColor("#0B6D8D")),
                  ),
                  Text(
                    dueAt,
                    style: TextStyle(color: HexColor("#0B6D8D"), fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
