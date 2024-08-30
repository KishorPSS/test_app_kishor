import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:connectivity_checker/connectivity_checker.dart';

void notification(String msg) {
  Fluttertoast.showToast(msg: msg);
}

String apiName = 'https://www.gurukulintl.com/eschoolplus/portal/api';
String apiLocalName = 'http://192.168.0.190/eschoolplus/portal/api';
String apiKey = '3OZNsHgGOwcGZwtEVQ4bkopWc1bSc4kh';

Color backgroundColor = const Color.fromRGBO(240, 240, 240, 1);
// Color backgroundColor = const Color.fromRGBO(240, 244, 255, 1);
// Color backgroundColor2 = const Color.fromRGBO(240, 240, 240, 1);
Color blushText = HexColor('#0C6992');

dateToTime(String date) {
  DateTime parseDate = DateFormat("dd-MM-yyyy hh:mm").parse(date);
  String kk = DateFormat('hh mm a').format(parseDate).toString();

  return kk;
}

dateToDate(String date) {
  DateTime parseDate = DateFormat("dd-MM-yyyy hh:mm").parse(date);
  String kk = DateFormat('dd, MMM yyyy').format(parseDate).toString();

  return kk;
}

dateToDate2(String date) {
  DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm").parse(date);
  String kk = DateFormat('dd, MMM yyyy').format(parseDate).toString();

  return kk;
}

Future<bool> isInternet() async {
  if (await ConnectivityWrapper.instance.isConnected) {
    return true;
  } else {
    return false;
  }
}

showLoading(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    content: Column(mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CircularProgressIndicator(),
        )),
      ],
    ),
  );
  showDialog(barrierDismissible: false, context: context, builder: (context) {

    return alertDialog;
  },);
}
