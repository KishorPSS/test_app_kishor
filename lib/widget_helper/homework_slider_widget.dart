import 'package:carousel_slider/carousel_slider.dart';
import 'package:eschoolapp/screen/homework_detaile_screen.dart';
import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../models/homework_model.dart';
import '../screen/homework_screen.dart';

class HomeworkSliderWidget extends StatefulWidget {
  final List<HomeworkModel> homeworkModel;
  final List<HomeworkModel> firstList;
  final List<HomeworkModel> secondList;

  const HomeworkSliderWidget(
      {super.key, required this.firstList, required this.secondList, required this.homeworkModel});

  @override
  State<HomeworkSliderWidget> createState() => _HomeworkSliderWidgetState();
}

class _HomeworkSliderWidgetState extends State<HomeworkSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      containerListSlider(widget.firstList),
      containerListSlider(widget.secondList)
    ];

    return MyContainer(
      top: 5,
      colorBool: false,
      left: 20,
      right: 20,
      bottom: 15,
      child: MyContainer(
        boxShadow: true,
        child: Column(children: [
           HeaderRow(
            title: 'Latest Homework',
            subTitle: InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeworkScreen(homeworkData: widget.homeworkModel,),));

            }, child: const Text("View All")),
          ),
          CarouselSlider(
              items: items,
              options: CarouselOptions(
                  height: 370,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                      // if()
                    });
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.asMap().entries.map((entry) {
              return GestureDetector(
                // onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}

SizedBox containerListSlider(List<HomeworkModel> homeworkModel) {
  return SizedBox(
    child: ListView.builder(
      // shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // primary: false,
      itemCount: homeworkModel.length ,
      // itemCount: homeworkModel.length > 3 ? 3 : homeworkModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeworkDetaileScreen(
                        homeworkModel: homeworkModel[index],
                          createdAt:
                              homeworkModel[index].createdAt.toString(),
                          subject:
                              homeworkModel[index].subjectName.toString(),
                          description:
                              homeworkModel[index].description.toString(),
                          dueAt: homeworkModel[index].dueDate.toString(),
                          question:
                              homeworkModel[index].question.toString())));
            },
            child: MyContainer(
              top: 8,
              right: 10,
              left: 10,
              bottom: 8,

              boxShadow: true,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextSmall(
                          title:
                              homeworkModel[index].subjectName.toString(),
                          color: HexColor("#0C6992"),
                        ),
                        MyTextMini(
                            title: homeworkModel[index].createdAt != null
                                ?homeworkModel[index].createdAt.toString() ==
                                DateFormat('MMM d, y')
                                    .format(DateTime.now())
                                    .toString()
                                ? "Today"
                                : homeworkModel[index].createdAt.toString()
                                : '',
                            color: HexColor("#8A8B8E")),


                      ]),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextSmall(
                          title: homeworkModel[index]
                              .question
                              .toString()
                              .trim(),
                          maxLines: 3,
                        ),
                      ),
                      // SizedBox(
                      //   // height: 45,
                      //   width: double.infinity,
                      //   child: MyTextButton(
                      //       callback: () {},
                      //       radius: 10,
                      //       bgColor: HexColor("#0C6992"),
                      //       myWidget: const MyTextSmall(
                      //         title: "View",
                      //         color: Colors.white,
                      //       )),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
// class ContainerListSlider extends StatefulWidget {
//   final List<HomeworkModel> homeworkModel;
//   final int itemIndex;
//   const ContainerListSlider(
//       {super.key, required this.homeworkModel, required this.itemIndex});
//
//   @override
//   State<ContainerListSlider> createState() => _ContainerListSliderState();
// }
//
// class _ContainerListSliderState extends State<ContainerListSlider> {
//
//
//   // kk() {
//   //   List<HomeworkModel> homeworkModel = [];
//   //   int indexEnd = 3 * widget.itemIndex;
//   //   if (indexEnd != 0) {
//   //     print('if');
//   //     print(indexEnd);
//   //
//   //     homeworkModel=widget.homeworkModel;
//   //     homeworkModel.removeRange(0, indexEnd);
//   //   } else {
//   //     print(indexEnd);
//   //     print('else');
//   //     homeworkModel=widget.homeworkModel;
//   //   }
//   //
//   //     homeworkModel;
//   //
//   //
//   // }
// // @override
// //   void initState() {
// //
// //     super.initState();
// //     kk();
// //   }
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             primary: false,
//             itemCount: widget.homeworkModel.length > 3
//                 ? 3
//                 : widget.homeworkModel.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                 child: MyContainer(
//                   top: 8,
//                   right: 10,
//                   left: 10,
//                   bottom: 8,
//                   boxShadow: true,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 5,
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               MyTextSmall(
//                                 title: widget.homeworkModel[index].subjectName
//                                     .toString(),
//                                 color: HexColor("#0C6992"),
//                               ),
//                               const Gap(5),
//                               MyTextSmall(
//                                 title: widget.homeworkModel[index].description
//                                     .toString()
//                                     .trim(),
//                                 maxLines: 3,
//                               ),
//                             ]),
//                       ),
//                       const Gap(10),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           children: [
//                             Align(
//                                 alignment: Alignment.centerRight,
//                                 child: MyTextMini(
//                                     title: "15 Dec",
//                                     color: HexColor("#8A8B8E"))),
//                             const Gap(20),
//                             SizedBox(
//                               // height: 45,
//                               width: double.infinity,
//                               child: MyTextButton(
//                                   callback: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               HomeworkDetaileScreen(
//                                                   createdAt: widget
//                                                       .homeworkModel[index]
//                                                       .createdAt
//                                                       .toString(),
//                                                   subject: widget
//                                                       .homeworkModel[index]
//                                                       .subjectName
//                                                       .toString(),
//                                                   description: widget
//                                                       .homeworkModel[index]
//                                                       .description
//                                                       .toString(),
//                                                   dueAt: widget
//                                                       .homeworkModel[index]
//                                                       .dueDate
//                                                       .toString(),
//                                                   question: widget
//                                                       .homeworkModel[index]
//                                                       .question
//                                                       .toString()),
//                                         ));
//                                   },
//                                   radius: 10,
//                                   bgColor: HexColor("#0C6992"),
//                                   myWidget: const MyTextSmall(
//                                     title: "View",
//                                     color: Colors.white,
//                                   )),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           )
//           // ContainerListSlider(),
//           // ContainerListSlider(),
//         ],
//       ),
//     );
//   }
// }
