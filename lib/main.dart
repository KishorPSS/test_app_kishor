import 'dart:convert';

import 'package:eschoolapp/notification/firebase_push_notification.dart';
import 'package:eschoolapp/screen/homework_detaile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:overlay_support/overlay_support.dart';
import 'dashboard.dart';
import 'in_up_out/log_in_screen.dart';
import 'in_up_out/splash_screen.dart';
import 'notification/notification_testing.dart';

final navigatorKey = GlobalKey<NavigatorState>();
// FUnction to the  listen background changes
// Future firebaseBackgroundMessaging(RemoteMessage message) async {
//   String payloadData = jsonEncode(message.data);
//   print('Handel a background message ${message.messageId}');
//   if (message.notification != null) {
//     print('Some Notification Received');
//     PushNotification.showSimpleNotification(
//       title: message.notification!.title!,
//       body: message.notification!.body!,
//       payload: payloadData,
//     );
//   }
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDCC8Qe-CQlpY1Nv2Qb4Apt2FK9VVqQzpY',
          appId: '1:396008726305:android:a71ccf7da15c38bfb5a860',
          messagingSenderId: '396008726305',
          projectId: 'gurukul-notification'));
  // RemoteMessage? initialMessage= await  FirebaseMessaging.instance.getInitialMessage();
  // if(initialMessage!=null){
  //   print(initialMessage);
  //   PushNotification notification=PushNotification(
  //     tittle: initialMessage.notification!.title!,
  //      body: initialMessage.notification!.body!,
  //     dataBody: initialMessage.data['body'],
  //     dataTitle: initialMessage.data['title'],
  //   );
  // }


  // working
  // on background Notification Tabbed
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   if (message.notification != null) {
  //     print('Background Notification Tabbed');
  //     navigatorKey.currentState
  //         ?.pushNamed('/notificationPage', arguments: message);
  //   }
  // });
  // PushNotification.initial();
  // PushNotification.localNotiInit();
  // PushNotification.startListeningForNewNotification();

  // Liston to background  notification

  // FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessaging);
  // to handel foreground notification
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   String payloadData = jsonEncode(message.data);
  //   print('Got a Message Foreground');
  //   if (message.notification != null) {
  //     PushNotification.showSimpleNotification(
  //       title: message.notification!.title!,
  //       body: message.notification!.body!,
  //       payload: payloadData,
  //     );
  //   }
  // });
  // Liston to Terminated  notification

// FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMsg) {
//     String payloadData = jsonEncode(remoteMsg?.data);
//     if (remoteMsg != null) {
//       if (remoteMsg.notification != null) {
//         PushNotification.showSimpleNotification(
//           title: remoteMsg.notification!.title!,
//           body: remoteMsg.notification!.body!,
//           payload: payloadData,
//         );
//
//      }
//       print('Terminated Notification Called');
//     }
//   });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    final textTheme = Theme.of(context).textTheme;
    return
      // OverlaySupport( child:
      MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
          fontFamily: 'LexendDeca',
      
          // textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          //   bodyMedium: GoogleFonts.oswald(textStyle: textTheme.bodyMedium),
          // ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          // Navigator.of(context).pushNamed("/homework_Detail_Page",arguments:"Msg form back Screen")
          // msg= ModalRoute.of(context)!.settings.argument as String
          "/": (context) => SplashScreen(),
          "/notificationPage": (context) => NotificationTestingPage(),
          "/homework_Details_Page": (context) => HomeworkDetaileScreen(
              // createdAt: createdAt, subject: subject, description: description, dueAt: dueAt, question: question
              ),
        },
        // home:
        //     // DashBoard(),
        //     SplashScreen(),
        // const LogInScreen()
      // ),
    );
  }
}
// DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss")
//     .parse(homeworkData[index].createdAt.toString());
// String formattedDate =
// DateFormat('dd-MM-yyyy').format(tempDate);
// DateFormat('MMM d, y').format(DateTime.now())
