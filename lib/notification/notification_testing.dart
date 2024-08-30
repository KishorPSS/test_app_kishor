import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationTestingPage extends StatefulWidget {
  const NotificationTestingPage({super.key});

  @override
  State<NotificationTestingPage> createState() =>
      _NotificationTestingPageState();
}

class _NotificationTestingPageState extends State<NotificationTestingPage> {
  Map payload = {};
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    if (data is RemoteMessage) {
      payload = data.data;
    }
    if (data is NotificationResponse) {
      payload = jsonDecode(data.payload!);
    }
    return Scaffold(appBar: AppBar(title: Text('Notification Texting')),
      body: Center(
        child: Text(payload.toString(),style: TextStyle(fontSize: 19),),
      ),
    );
  }
}
