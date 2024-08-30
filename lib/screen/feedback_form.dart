import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constants;
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import '../global_helper.dart';
import '../models/question_model.dart';
import '../widget_helper/widgets_helper.dart';

class FeedbackForm extends StatefulWidget {
  final String studentId;
  final String std;
  const FeedbackForm({
    super.key,
    required this.studentId,
    required this.std,
  });

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  @override
  void initState() {
    super.initState();
    initial();
  }

  String? selectedVal;
  List<QuestionModel>? questionsData;
  Future initial() async {
    questionsData = await GlobalHelper().getFeedBackQuestion();
    subjectList = await GlobalHelper().getSubjectList(widget.std);

    setState(() {});
  }

  TextEditingController otherConcern = TextEditingController();
  List<dynamic> selected = [];
  List<dynamic> selectedSubQue = [];
  List<dynamic> subjectList = [];

  bool kk = true;
  @override
  Widget build(BuildContext context) {
    selected.addAll(List.generate(8, (index) => String));
    selectedSubQue.addAll(List.generate(5, (index) => String));
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
            title: "Feedback",
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
                      'Feedback',
                      style: const TextStyle(fontSize: 18),
                    )),
              ),
            ),
          )),
      body: questionsData == null
          ? const Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    questionsData!.isEmpty
                        ? Center(child: Text('Yet No Feedback From'),)

                        : Row(
                            children: [
                              const Text('Select Subject',
                                  style: TextStyle(fontSize: 18)),
                              const Gap(10),
                              Expanded(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  value: selectedVal,
                                  items: subjectList.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value['subject_master_id'],
                                      child:
                                          Text(value['txtSubject'].toString()),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedVal = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                    const Gap(10),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: questionsData?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1} ) ${questionsData![index].questionTitle}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            (questionsData![index].optionFirst != null &&
                                    questionsData![index].optionFirst != '')
                                ? Row(
                                    children: [
                                      Radio(
                                        value:
                                            questionsData![index].optionFirst,
                                        groupValue: selected[index],
                                        onChanged: (value) {
                                          setState(() {
                                            selected[index] = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        questionsData![index]
                                            .optionFirst
                                            .toString(),
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    ],
                                  )
                                : const SizedBox(),
                            (questionsData![index].optionFirst != null &&
                                    questionsData![index].optionFirst != '')
                                ? Row(
                                    children: [
                                      Radio(
                                        value:
                                            questionsData![index].optionSecond,
                                        groupValue: selected[index],
                                        onChanged: (value) {
                                          setState(() {
                                            selected[index] = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        questionsData![index]
                                            .optionSecond
                                            .toString(),
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    ],
                                  )
                                : const SizedBox(),
                            (questionsData![index].optionThird != null &&
                                    questionsData![index].optionThird != '')
                                ? Row(
                                    children: [
                                      Radio(
                                        value:
                                            questionsData![index].optionThird,
                                        groupValue: selected[index],
                                        onChanged: (value) {
                                          setState(() {
                                            selected[index] = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        questionsData![index]
                                            .optionThird
                                            .toString(),
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    ],
                                  )
                                : const SizedBox(),
                            (questionsData![index].optionFirth != null &&
                                    questionsData![index].optionFirth != '')
                                ? Row(
                                    children: [
                                      Radio(
                                        value:
                                            questionsData![index].optionFirth,
                                        groupValue: selected[index],
                                        onChanged: (value) {
                                          setState(() {
                                            selected[index] = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        questionsData![index]
                                            .optionFirth
                                            .toString(),
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    ],
                                  )
                                : const SizedBox(),
                            questionsData![index].hasSubquestion != '0'
                                ? Column(
                                    children: [
                                      // Text(questionsData![index]
                                      //     .subQuestion!
                                      //     .length
                                      //     .toString()),
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: questionsData![index]
                                            .subQuestion!
                                            .length,
                                        itemBuilder: (context, subIndex) {
                                          List<dynamic>? subQueData = [];

                                          subQueData =
                                              questionsData![index].subQuestion;
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              // child: Text(questionsData![index].subQuestion![1].toString())
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ' ${subIndex + 1} ) ${subQueData![subIndex]['feedback_question']}',
                                                    style:
                                                        const TextStyle(fontSize: 18),
                                                  ),
                                                  (subQueData[subIndex][
                                                                  'feedback_option_1'] !=
                                                              null &&
                                                          subQueData[subIndex][
                                                                  'feedback_option_1'] !=
                                                              'feedback_option_1')
                                                      ? Row(
                                                          children: [
                                                            Radio(
                                                              value: subQueData[
                                                                      subIndex][
                                                                  'feedback_option_1'],
                                                              groupValue:
                                                                  selectedSubQue[
                                                                      subIndex],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectedSubQue[
                                                                          subIndex] =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            Text(
                                                              subQueData[subIndex]
                                                                      [
                                                                      'feedback_option_1']
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        )
                                                      : const SizedBox(),
                                                  (subQueData[subIndex][
                                                                  'feedback_option_2'] !=
                                                              null &&
                                                          subQueData[subIndex][
                                                                  'feedback_option_2'] !=
                                                              'feedback_option_2')
                                                      ? Row(
                                                          children: [
                                                            Radio(
                                                              value: subQueData[
                                                                      subIndex][
                                                                  'feedback_option_2'],
                                                              groupValue:
                                                                  selectedSubQue[
                                                                      subIndex],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectedSubQue[
                                                                          subIndex] =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            Text(
                                                              subQueData[subIndex]
                                                                      [
                                                                      'feedback_option_2']
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        )
                                                      : const SizedBox(),
                                                  (subQueData[subIndex][
                                                                  'feedback_option_3'] !=
                                                              null &&
                                                          subQueData[subIndex][
                                                                  'feedback_option_3'] !=
                                                              'feedback_option_3')
                                                      ? Row(
                                                          children: [
                                                            Radio(
                                                              value: subQueData[
                                                                      subIndex][
                                                                  'feedback_option_3'],
                                                              groupValue:
                                                                  selectedSubQue[
                                                                      subIndex],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectedSubQue[
                                                                          subIndex] =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            Text(
                                                              subQueData[subIndex]
                                                                      [
                                                                      'feedback_option_3']
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        )
                                                      : const SizedBox(),
                                                  (subQueData[subIndex][
                                                                  'feedback_option_4'] !=
                                                              null &&
                                                          subQueData[subIndex][
                                                                  'feedback_option_4'] !=
                                                              'feedback_option_4')
                                                      ? Row(
                                                          children: [
                                                            Radio(
                                                              value: subQueData[
                                                                      subIndex][
                                                                  'feedback_option_4'],
                                                              groupValue:
                                                                  selectedSubQue[
                                                                      subIndex],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectedSubQue[
                                                                          subIndex] =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            Text(
                                                              subQueData[subIndex]
                                                                      [
                                                                      'feedback_option_4']
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              ));
                                        },
                                      ),
                                    ],
                                  )
                                : Container()
                          ],
                        );
                      },
                    ),
                    const Text(
                      'Any Other Concern',
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                          maxLines: null,
                          controller: otherConcern,
                          decoration:
                              const InputDecoration(border: OutlineInputBorder())),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: HexColor('#0C6992'),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              onPressed: () {
                                // print('selectedVal: $selectedVal');

                                if (selected[0].runtimeType == String &&
                                    selected[1].runtimeType == String &&
                                    selected[2].runtimeType == String &&
                                    selected[3].runtimeType == String &&
                                    selected[4].runtimeType == String &&
                                    selected[5].runtimeType == String &&
                                    selected[6].runtimeType == String &&
                                    selected[7].runtimeType == String &&
                                    selectedSubQue[0].runtimeType == String &&
                                    selectedSubQue[1].runtimeType == String &&
                                    selectedSubQue[2].runtimeType == String &&
                                    selectedSubQue[3].runtimeType == String &&
                                    selectedSubQue[4].runtimeType == String &&
                                    otherConcern.text != '' &&
                                    selectedVal != null) {
                                  GlobalHelper().feedbackAnswers(
                                      widget.studentId,
                                      selected[0],
                                      selected[1],
                                      selected[2],
                                      selected[3],
                                      selected[4],
                                      selected[5],
                                      selected[6],
                                      selected[7],
                                      selectedSubQue[0],
                                      selectedSubQue[1],
                                      selectedSubQue[2],
                                      selectedSubQue[3],
                                      selectedSubQue[4],
                                      otherConcern.text,
                                      selectedVal.toString());

                                  constants.notification('Fill Successfully');
                                } else {
                                  constants.notification(
                                      'please select all questions answers');
                                }
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
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
