// import 'dart:developer';
//
// import 'package:eschoolapp/global_helper.dart';
// import 'package:eschoolapp/screen/fees_history_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hexcolor/hexcolor.dart';
// import '../widget_helper/widgets_helper.dart';
//
// class FeesScreen extends StatefulWidget {
//   final String studentId;
//   const FeesScreen({super.key, required this.studentId});
//   @override
//   State<FeesScreen> createState() => _FeesScreenState();
// }
//
// class _FeesScreenState extends State<FeesScreen> {
//   List<Map<String, dynamic>> feesDetails=[];
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   initial();
//   // }
//   // initial()async{
//   //   feesDetails=await GlobalHelper().feesDetails(widget.studentId);
//   // log(feesDetails.toString());
//   // setState(() {
//   //
//   // });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
//         appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(155 - 10),
//             child: MyAppBar(
//               trailing: MyTextButton(
//                 callback: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FeesHistoryScreen(),
//                       ));
//                 },
//                 myWidget: const Icon(
//                   Icons.more_vert,
//                   color: Colors.white,
//                 ),
//               ),
//               leading: MyTextButton(
//                 myWidget: const Icon(Icons.arrow_back_ios, color: Colors.white),
//                 callback: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               title: "Fees",
//               containerHeight: 130,
//               between: const Positioned(
//                   bottom: -20, left: 21, right: 21, child: DropDownFeesYear()),
//             )),
//         body: FutureBuilder(
//           future: GlobalHelper().feesDetails(widget.studentId),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               if (snapshot.hasData) {
//                 List<dynamic> feesDataList = [];
//                 Map<String,dynamic> mapData ={};
//                 mapData=snapshot.data  as Map<String,dynamic>;
//                 log(mapData.toString());
//                 // var datafees=snapshot.data;
//                 feesDataList = mapData['installments'] as List<dynamic>;
//                 log(feesDataList.toString());
//                 return SingleChildScrollView(
//                   physics: ScrollPhysics(),
//                   child: Column(
//                     children: [
//                               const HeaderRow(boxShadow: true, title: "Installment"),
//                               Gap(15),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           feesDetails.add(feesDataList[index]['\u0000yii\\db\\BaseActiveRecord\u0000_attributes']);
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child:
//                           InstallmentsWidget(
//                                     title: "Installment ${feesDetails[index]['installment']}",
//                                     paid: feesDetails[index]['total_fees'].toString(),
//                                     due: "0/-",
//                                     btn: "Pay Now",
//                                     color: HexColor('#135E9E'),)
//
//                             // Container(
//                             //   child: Column(children: [
//                             //   Text(feesDetails[index]['\u0000yii\\db\\BaseActiveRecord\u0000_attributes'].toString()),
//                             //   ]),
//                             // ),
//                             // Container(
//                             //   child: Column(children: [
//                             //   Text(feesDetails[index].toString()),
//                             //   ]),
//                             // ),
//                           );
//                         },
//                         itemCount: feesDataList.length,
//
//                       ),
//
//                               Gap(20),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: MyContainer(top: 10,bottom: 10,left: 10,right: 10, boxShadow: true,
//                                     child: Column(
//                                   children: [
//                                     HeaderRow( title: "Fees Information"),
//                                     Gap(15),
//                                     Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                       children: [
//                                         FeesColumn(
//                                           firstVal: "Total Fees",
//                                           secondVal:
//                                           mapData['total_fees'].toString(),
//                                         ),  FeesColumn(
//                                           firstVal: "Total Paid",
//                                           secondVal:
//                                           mapData['paid_fees'].toString(),
//                                         ),  FeesColumn(
//                                           firstVal: "Total Balance",
//                                           secondVal:
//                                           mapData['balance_fees'].toString(),
//                                         ),
//                                       ],
//                                     )
//                                   ],)),
//                               ), Gap(10),
//
//                       // Container(child: Text(feesDataList.length.toString(),style: TextStyle(fontSize: 20),),),
//                     ],
//                   ),
//                 );
//               } else {
//                 return Text('No Data');
//               }
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         )
//
//         // SingleChildScrollView(
//         //   child: Padding(
//         //     padding: const EdgeInsets.symmetric(horizontal: 20),
//         //     child:feesDetails==null?const Center(child: CircularProgressIndicator(),): Column(
//         //       children: [
//         //         const HeaderRow(boxShadow: true, title: "Installment"),
//         //         Gap(15),
//         //         InstallmentsWidget(
//         //           title: "Installment 1",
//         //           paid: "25000/-",
//         //           due: "10000/-",
//         //           btn: "Paid",
//         //           color: HexColor('#ABADAE'),
//         //         ),
//         //         const Gap(20),
//         //         InstallmentsWidget(
//         //           title: "Installment 2",
//         //           paid: "10000/-",
//         //           due: "0/-",
//         //           btn: "Pay Now",
//         //           color: HexColor('#135E9E'),
//         //         ),
//         //         Gap(20),
//         //         MyContainer(top: 10,bottom: 10,left: 10,right: 10, boxShadow: true,
//         //             child: Column(
//         //           children: [
//         //             HeaderRow( title: "Fees Information"),
//         //             Gap(15),
//         //             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //               children: [
//         //                 FeesColumn(
//         //                   firstVal: "Total Fees",
//         //                   secondVal:
//         //                   feesDetails!['total_fees'].toString(),
//         //                 ),  FeesColumn(
//         //                   firstVal: "Total Paid",
//         //                   secondVal:
//         //                   feesDetails!['paid_fees'].toString(),
//         //                 ),  FeesColumn(
//         //                   firstVal: "Total Balance",
//         //                   secondVal:
//         //                   feesDetails!['balance_fees'].toString(),
//         //                 ),
//         //               ],
//         //             )
//         //           ],
//         //         )), const Gap(20),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         );
//   }
// }
//
// class InstallmentsWidget extends StatelessWidget {
//   final String title;
//   final String paid;
//   final String due;
//   final String btn;
//   final Color color;
//   const InstallmentsWidget(
//       {super.key,
//       required this.title,
//       required this.paid,
//       required this.due,
//       required this.btn,
//       required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return MyContainer(
//         right: 10,
//         left: 10,
//         top: 10,
//         bottom: 10,
//         height: 200,
//         boxShadow: true,
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 MyTextMedium(
//                   title: title,
//                   color: HexColor("#0C6992"),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 FeesColumn(
//                   firstVal: paid,
//                   secondVal: "Total Paid",
//                 ),
//                 Container(
//                     height: 100,
//                     child: VerticalDivider(
//                       thickness: 3.5,
//                       color: HexColor('#ABADAE'),
//                     )),
//                 FeesColumn(
//                   firstVal: due,
//                   secondVal: "Total Due",
//                 ),
//               ],
//             ),
//             Container(
//                 width: double.infinity,
//                 child: MyTextButton(
//                     radius: 5,
//                     bgColor: color,
//                     myWidget: MyTextMedium(
//                       title: btn,
//                       color: Colors.white,
//                     ))),
//           ],
//         ));
//   }
// }
//
// class FeesColumn extends StatelessWidget {
//   final String firstVal;
//   final String secondVal;
//   const FeesColumn(
//       {super.key, required this.firstVal, required this.secondVal});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MyTextSmall(title: firstVal, color: HexColor('#646668')),
//         Gap(5),
//         MyTextSmall(title: secondVal, color: HexColor('#646668')),
//       ],
//     );
//   }
// }
