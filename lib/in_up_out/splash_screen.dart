import 'package:eschoolapp/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_helper.dart';
import 'log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? studentId;
  Map<String, dynamic> onlineExamMark = {};

  @override
  void initState() {
    super.initState();
    checkIsLogin();
  }

  checkIsLogin() async {
    var prefer = await SharedPreferences.getInstance();
    final bool? isLogin = prefer.getBool('isLogin');
    print(isLogin);

    if (isLogin == null || isLogin == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LogInScreen()));
    } else {
      var prefer = await SharedPreferences.getInstance();

      studentId = prefer.getString('studentId');
print(studentId);
      var studentMap =
          await GlobalHelper().getStudentInfo(studentId!);
print(studentMap);
      onlineExamMark =
          await GlobalHelper().onlineExamMarks(studentId!, studentMap!['txtYear'], studentMap!['numStandard']);

      if (onlineExamMark != {}) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashBoard(
                  studentMap: studentMap,
                  currentYear: studentMap['txtYear'],
                  std: studentMap['numStandard'],
                  studentId: studentId!,
                  onlineExamMarks: onlineExamMark,
                )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/splash_bg.png"))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/icon_logo.png'),
            ])));
  }
}
