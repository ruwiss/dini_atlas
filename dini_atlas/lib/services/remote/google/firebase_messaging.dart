import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

abstract class FirebaseMessagingService {
  static Future<void> initFirebaseNotifications() async {
    final firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();

    debugPrint("Firebase Messaging Token: $fcmToken");
  }
}
