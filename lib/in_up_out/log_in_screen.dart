import 'package:eschoolapp/global_helper.dart';
import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constant;
import '../dashboard.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hide = true;
  String? studentId;
  String? currentYear;
  String? std;
  Map<String, dynamic>? studentMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset('assets/logo1.png')),
                    ),
                    const Gap(5),
                    const Center(
                        child: Text(
                      'eSchool+',
                      style: TextStyle(fontSize: 20),
                    )),
                    const Gap(50),
                    const MyTextBig(
                      title: "Sign In",
                      fontWeight: FontWeight.w500,
                    ),
                    const Gap(20),
                    MyTextMedium(
                      title: "Username",
                      color: HexColor("#0C6992"),
                    ),
                    MyTextField(
                        controller: userName,
                        hintText: "enter username here.."),
                    const Gap(20),
                    MyTextMedium(
                      title: "Password",
                      color: HexColor("#0C6992"),
                    ),
                    MyTextField(
                      controller: password,
                      hintText: "enter password here..",
                      hide: hide,
                      suffixIcon: IconButton(
                        icon: Icon(
                          hide ? Icons.visibility : Icons.visibility_off,
                          size: 25,
                          color: HexColor("#9E95A2"),
                        ),
                        onPressed: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: MyTextButton(
                          bgColor: HexColor("#7f9735"),
                          radius: 10,
                          callback: () async {
                            constant.showLoading(context);
                            var uName = userName.text.trim();
                            var uPass = password.text.trim();
                            if (uName != '' && uPass != '') {
                              var kkk =
                                  await GlobalHelper().login(uName, uPass);
                              if (kkk['success'] == true) {
                                var prefer =
                                    await SharedPreferences.getInstance();

                                await prefer.setBool('isLogin', kkk['success']);

                                await prefer.setString('studentId',
                                    kkk['student_details'][0]['numStudentID']);
                                studentId =
                                    kkk['student_details'][0]['numStudentID'];
                                std = kkk['student_details'][0]['numStandard'];
                                currentYear=kkk['student_details'][0]['txtYear'];
                                // await prefer.setString(
                                //     'name',
                                //     kkk['student_details'][0]
                                //         ['txtStudentName']);
                                // await prefer.setString('std',
                                //     kkk['student_details'][0]['numStandard']);
                                // await prefer.setString('surname',
                                //     kkk['student_details'][0]['txtSurname']);
                                // await prefer.setString('currentYear',
                                //     kkk['student_details'][0]['txtYear']);
                                // String? studentId =
                                //     prefer.getString('studentId');
                                // String? currentYear =
                                //     prefer.getString('currentYear');
                                // String? std = prefer.getString('std');
                                studentMap = await GlobalHelper()
                                    .getStudentInfo(studentId.toString());

                                  var onlineExamMark = await GlobalHelper()
                                      .onlineExamMarks(
                                          studentId!, currentYear!, std!);
if(onlineExamMark!={}){
  constant.notification("Successfully LogIn");
  Navigator.pop(context);
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashBoard(
          studentMap: studentMap!,
          studentId: studentId!,
          std: std!,
          currentYear: currentYear!,
          onlineExamMarks: onlineExamMark,
        ),
      ));
}


                              } else {
                                Navigator.pop(context);
                                constant.notification("Wrong Credential");
                              }
                            } else {
                              Navigator.pop(context);
                              constant.notification('Please Fill All Field');
                            }
                          },
                          myWidget: const MyTextMedium(
                            title: "Sign In",
                            color: Colors.white,
                          )),
                    ),
                    const Gap(30)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
