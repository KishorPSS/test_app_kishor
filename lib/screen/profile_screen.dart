import 'package:accordion/accordion.dart';
import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'feedback_form.dart';

class ProfileScreen extends StatefulWidget {
  final String? studentId;
  final String? std;
  final Map<String, dynamic>? studentMap;
  const ProfileScreen(
      {super.key,
      required this.studentMap,
      required this.studentId,
      required this.std});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(240 - 30),
          child: MyAppBar(
            leading: MyTextButton(
              callback: () => Navigator.pop(context),
              myWidget: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: "Student Profile",
            containerHeight: 150,
            between: Positioned(
                bottom: -75,
                left: 25,
                right: 25,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        width: 120,
                        height: 120,
                        child: widget.studentMap!['profile_pic'] == null
                            ? Image.asset(
                                'assets/avatar-3.jpg.png',
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.studentMap!['profile_pic'],
                                fit: BoxFit.contain,
                              ),
                      ),
                      MyTextSmall(
                          title:
                              "${widget.studentMap!['txtStudentName'] ?? ''} ${widget.studentMap!['txtSurname'] ?? ''}")
                    ],
                  ),
                )),
          )),
      body: widget.studentMap!.isEmpty
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: MyContainer(
                        left: 5,
                        right: 5,
                        height: 370,
                        child: Accordion(
                          headerBackgroundColor: Colors.white,
                          contentBorderColor: Colors.white,
                          children: [
                            AccordionSection(
                                // isOpen: true,
                                index: 0,
                                rightIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                header: const MyTextMedium(
                                  title: "Student Profile Details",
                                ),
                                content: Column(
                                  children: [
                                    section(
                                        "Standard:",
                                        widget.studentMap!['txtStandard'] ??
                                            ""),
                                    section(
                                        "Division:",
                                        widget.studentMap!['txtDivision'] ??
                                            ""),
                                    section("Roll No.:",
                                        widget.studentMap!['numRollNo'] ?? ""),
                                  ],
                                )),
                            AccordionSection(
                                rightIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                header: const MyTextMedium(
                                  title: "Parents Information Details",
                                ),
                                content: Column(
                                  children: [
                                    section(
                                        "Fathers:",
                                        widget.studentMap!['txtFatherName'] ??
                                            ""),
                                    section(
                                        "Phone:",
                                        widget.studentMap!['txtFMobileNo'] ??
                                            ""),
                                    section(
                                        "Mothers:",
                                        widget.studentMap!['txtMotherName'] ??
                                            ""),
                                  ],
                                )),
                            AccordionSection(
                                rightIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                header: const MyTextMedium(
                                  title: "General Information",
                                ),
                                content: Column(
                                  children: [
                                    section("Gender",
                                        widget.studentMap!['txtGender'] ?? ""),
                                    section(
                                        "Religion",
                                        widget.studentMap!['txtReligion'] ??
                                            ""),
                                    Container(
                                        child: section(
                                            "Address",
                                            widget.studentMap!['txtAddress'] ??
                                                "")),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackForm(
                              studentId: widget.studentId!, std: widget.std!),
                        )),
                    child: MyContainer(
                        width: double.infinity,
                        height: 80,
                        color: HexColor("#0B6D8D"),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const MyTextSmall(
                              color: Colors.white,
                              title: "Complete the feedback form",
                            ),
                            SizedBox(
                                width: 55,
                                height: 55,
                                child: Image.asset("assets/2.png"))
                          ],
                        )),
                  ),
                ],
              ),
            ),
    );
  }
}

Row section(String first, String second) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: MyTextMedium(fontSize: 16,
          title: first,
        ),
      ),
      Expanded(
          child: MyTextSmall(fontSize: 14,
        title: second,
        maxLines: 100,
      ))
    ],
  );
}
