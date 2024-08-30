import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widget_helper/widgets_helper.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(270-24),
          child: MyAppBar(

            leading: MyTextButton(
              myWidget:
                  const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              callback: () {
                Navigator.pop(context);
              },
            ),
            title: "Update Profile",
            containerHeight: 150,
            between: const Positioned(
                bottom: -90,
                left: 25,
                right: 25,
                child: Center(
                  child: Column(
                    children: [
                      ProfileLogo(
                        width: 120,
                        height: 120,
                        imagePath: 'assets/avatar-3.jpg.png',
                      ),
                      MyTextMedium(title: "Nikhil Pashte")
                    ],
                  ),
                )),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyTextSmall(
                  title: "Father's Email ID", fontWeight: FontWeight.w400),
              const Gap(5),
              const MyTextField(border: true, hintText: "father@Gmail.com"),
              const Gap(10),
              const MyTextSmall(
                  title: "Mother's Email ID", fontWeight: FontWeight.w400),
              const Gap(5),
              const MyTextField(border: true, hintText: "Mother@Gmail.com"),
              const Gap(10),
              const MyTextSmall(
                  title: "Father's Mobile Number", fontWeight: FontWeight.w400),
              const Gap(5),
              const MyTextField(border: true, hintText: "9876543210"),
              const Gap(10),
              const MyTextSmall(
                  title: "Mother's Mobile Number", fontWeight: FontWeight.w400),
              const Gap(5),
              const MyTextField(
                hintText: "9876543210",
                border: true,
              ),
              const Gap(10),
              const MyTextSmall(title: "Address", fontWeight: FontWeight.w400),
              const Gap(5),
              const MyTextField(
                  border: true, hintText: "khaki pad kalyan west"),
              const Gap(10),
              const MyTextSmall(
                  title: "Blood Group", fontWeight: FontWeight.w400),
              const MyTextField(border: true, hintText: "Ab+"),
              const Gap(15),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MyTextButton(
                    callback: () {},
                    radius: 10,
                    bgColor: HexColor("#0B6D8D"),
                    myWidget: const MyTextSmall(
                      title: "Update",
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
class ProfileLogo extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final VoidCallback? callback;
  final String? studentName;
  const ProfileLogo(
      {super.key,
        required this.height,
        required this.imagePath,
        required this.width,
        this.callback,
        this.studentName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (callback != null) {
              callback!();
            }
          },

          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            width: width,
            height: height,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            // imagePath: imagePath,
          ),
          // CircleAvatar(radius: height, backgroundImage: AssetImage(imagePath)),
        ),
      ],
    );
  }
}
