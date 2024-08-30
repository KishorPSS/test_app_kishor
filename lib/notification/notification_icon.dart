import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Scaffold(
                  body: SingleChildScrollView(
                    child: Column(children: [
                                    Padding(
                    padding: const EdgeInsets.only( right: 10,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                        const MyTextMedium(title: "Notification"),
                        const Icon(Icons.more_vert)
                      ],
                    ),
                                    ),
                                  Column(
                          children: [
                            // NotificationTile(),
                            // NotificationTile(),
                            // NotificationTile(),
                            // NotificationTile(),
                          ],
                        )
                                    // const TabBar(
                                    //     labelStyle:
                                    //         TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                    //     isScrollable: true,
                                    //     tabAlignment: TabAlignment.center,
                                    //     tabs: [
                                    //       Tab(text: "All"),
                                    //       Tab(text: "Unread"),
                                    //       Tab(text: "Read"),
                                    //     ]),
                                    // const Expanded(
                                    //     child: TabBarView(
                                    //   children: [
                                    //     SingleChildScrollView(
                                    //         child: Padding(
                                    //       padding: EdgeInsets.symmetric(
                                    //           horizontal: 10,),
                                    //       child: Column(
                                    //         children: [
                                    //           NotificationTile(),
                                    //           NotificationTile(),
                                    //           NotificationTile(),
                                    //           NotificationTile(),
                                    //         ],
                                    //       ),
                                    //     )),
                                    //     SingleChildScrollView(
                                    //         child: Padding(
                                    //           padding: EdgeInsets.symmetric(
                                    //             horizontal: 10,),
                                    //           child: Column(
                                    //             children: [
                                    //               NotificationTile(),
                                    //               NotificationTile(),
                                    //               NotificationTile(),
                                    //               NotificationTile(),
                                    //             ],
                                    //           ),
                                    //         )),
                                    //     SingleChildScrollView(
                                    //         child: Column(
                                    //           children: [
                                    //             NotificationTile(),
                                    //             NotificationTile(),
                                    //             NotificationTile(),
                                    //             NotificationTile(),
                                    //           ],
                                    //         )),
                                    //   ],
                                    // ))
                                  ]),
                  )

                  );
            },
          );
        },
        icon: const Icon(
          color: Colors.white,
          Icons.notifications,
          size: 31,
        ));
  }
}
class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4 ,horizontal: 5),
      child: MyContainer(
        top: 5, left: 5, boxShadow: true, right: 5, bottom: 5,
        // height: 70,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child:
                // Stack(children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(decoration: const BoxDecoration( shape: BoxShape.circle),
                        height: 40,
                        width: 40,clipBehavior: Clip.hardEdge,
                        // top: 5,left: 5,
                        child: Center(child: Image.asset("assets/avatar-3.jpg(1).png",fit: BoxFit.cover,)),
                      ),
                    ),const Positioned(child: Icon(Icons.brightness_1,color: Colors.blue,size: 12,))
                  ],
                ),

              ),
              Expanded(
                  flex: 5,
                  child: MyContainer(
                    // boxShadow: true,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const MyTextSmall(title:
                          "Science Fair Coming Soon. Get ready to showcase your projects",
                          maxLines: 2,
                        ),
                        const Gap(2),
                        MyTextSmall(title:
                          "Lost Wednesday at 1:42 AM",
                          color: HexColor("#8A8B8E")
                        )
                      ],
                    ),
                  )),
            ]),
      ),
    );
  }
}
