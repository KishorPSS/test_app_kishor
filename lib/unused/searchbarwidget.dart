import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  double width = 325;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            if (width == 325) {
              width = 1;
            } else {
              width = 325;
            }
          });
        },
        child: Container(
            // width: 360,
            width: double.infinity,
            height: 43,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(blurRadius: 25, color: Colors.black26)
                ],
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Stack(children: [
              AnimatedPositioned(
                  right: 0,
                  left: width,
                  bottom: 0,
                  top: 0,
                  duration: const Duration(milliseconds: 200),
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: HexColor("#0C6992")),
                        child:

                            // width != 0?

                            // child: TextField(
                            // onChanged: (value) => updatedList(value),
                            // style: TextStyle(
                            //   fontSize: 18,
                            //   fontWeight: FontWeight.w500,
                            //   letterSpacing: 1,
                            // ),
                            // decoration: InputDecoration(
                            //   contentPadding: EdgeInsets.only(
                            //     top: 7,
                            //     left: 10,
                            //   ),
                            //   // suffixIcon: Container(
                            //   //     width: 20,
                            //   //     height: 10,
                            //   //     decoration: BoxDecoration(
                            //   //         color: HexColor("#0c6980"),
                            //   //         borderRadius:
                            //   //         const BorderRadius.all(Radius.circular(11))),
                            //   //     child: Icon(
                            //   //       color: Colors.white,
                            //   //       Icons.search,
                            //   //       // size: 22,
                            //   //     )),
                            //   border: InputBorder.none,
                            //   isDense: true,
                            //   isCollapsed: true,
                            //   hintText: " Looking for...",
                            //   // ),
                            // ),
                            // ),

                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(right: 2, left: 4),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ))),

                        // : Row(
                        //     children: [
                        //       SizedBox(width: width, child: TextField()),
                        //       const Align(
                        //           alignment: Alignment.center,
                        //           child: Padding(
                        //             padding: EdgeInsets.only(right: 5),
                        //             child: Icon(Icons.search)
                        //           ))
                        //     ]
                        //   )
                      ))),
              // MyTextField(hintText: "Looking for")
            ])));
  }
}
