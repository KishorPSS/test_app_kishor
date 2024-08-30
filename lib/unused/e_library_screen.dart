// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hexcolor/hexcolor.dart';
// import '../widget_helper/searchbarwidget.dart';
// import '../widget_helper/widgets_helper.dart';
// class ELibraryScreen extends StatelessWidget {
//   const ELibraryScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           backgroundColor: Color.fromRGBO(240, 240, 240, 1),
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(170-24),
//             child: MyAppBar(
//                 between: Positioned(
//                   bottom: -15,
//                   left: 25,
//                   right: 25,
//                   child: SearchBarWidget(),
//                 ),
//                 containerHeight: 140,
//                 title: "E-Library",
//                 leading: MyBackButton()),
//           ),
//           body: TabBarWidget(
//             isScrollable: false,
//             tabAlignment: TabAlignment.fill,
//             firstTab: "E-Library",
//             secondTab: "Video",
//             firstWidget: SingleChildScrollView(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Gap(10),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                   ]),
//             ),
//             secondWidget: SingleChildScrollView(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Gap(10),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                     LibraryWidget(),
//                   ]),
//             ),
//           )),
//     );
//   }
// }
//
// class LibraryWidget extends StatelessWidget {
//   const LibraryWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
//       child: MyContainer(
//         boxShadow: true,
//         top: 5,
//         left: 8,
//         bottom: 5,
//         right: 8,
//         child: Row(
//           children: [
//              Expanded(
//                 flex: 9,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const MyTextSmall(
//                       title: "Newspaper Advertisement (s) -Notice of 28th AGM",
//                       maxLines: 2,
//                     ),
//                     MyTextButton(
//                         myWidget: MyTextMini(
//                       title: "Read Now",
//                       color: HexColor("#0C6992"),
//                     ))
//                   ],
//                 )),
//             const Gap(10),
//             Expanded(
//                 flex: 2,
//                 child: Image.asset(
//                   width: 40,
//                   height: 75,
//                   "assets/Pdf.png",
//                   fit: BoxFit.fill,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
