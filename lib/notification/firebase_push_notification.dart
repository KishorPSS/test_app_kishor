import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../main.dart';

class PushNotification {
  // String tittle;
  // String body;
  // String dataTitle;
  // String dataBody;
  // PushNotification({
  //   required this.tittle,
  //   required this.body,
  //   required this.dataBody,
  //   required this.dataTitle,
  // });

  // working
  static final firebaseMessaging = FirebaseMessaging.instance;
//  static  startListeningForNewNotification() async {
//     ///1. Terminated
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? remoteMsg) {
//       if (remoteMsg != null) {
//         String tripID = remoteMsg.data['tripID'];
//         print('Terminated Notification Called');
//       }
//     });
//
//     ///2. Foreground
// // FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMsg) {
// //   if (remoteMsg != null) {
// //     String tripID = remoteMsg.data['tripID'];
// //   }
// // });
// //     ///3.BackGround
// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMsg) {
// //       if (remoteMsg != null) {
// //         String tripID = remoteMsg.data['tripID'];
// //       }
// //     });
//   }

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // request notification permission
  static Future initial() async {
NotificationSettings settings=    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
// if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//   print('User granted permission');
// } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//   print('User granted provisional permission');
// } else {
//   print('User declined or has not accepted permission');
// }
//     print('User granted permission: ${settings.authorizationStatus}');

      final token = await firebaseMessaging.getToken();
    print("Devise Token ${await token}");
    FirebaseFirestore.instance.collection('token').doc(token).set({
      'tokenID':token,

    });
    // FirebaseMessaging.instance.subscribeToTopic('10th');
  }

  // initalize local notifications
  static Future localNotiInit() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  // on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {
    navigatorKey.currentState!
        .pushNamed("/notificationPage", arguments: notificationResponse);
  }

  // show a simple notification
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}
