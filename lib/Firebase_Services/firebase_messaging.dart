import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

void setupFCM() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Get FCM token
  String? token = await messaging.getToken();
  if (token != null) {
    debugPrint("🔑 FCM Token: $token");
  } else {
    debugPrint("❌ FCM Token is null");
  }

  // Handle foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Foreground message: ${message.notification?.title}");
  });

  // Handle background and terminated state messages
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("Message opened from background: ${message.data}");
  });
}
