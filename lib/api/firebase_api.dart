import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_to_do_list/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();

    print('FCM Token: $fCMToken');

    // intiPushNotifications();
  }
}

// void handleMessage(RemoteMessage? message) {
//   if (message == null) return;

//   navigatorKey.currentState?.pushNamed(
//     '/notification_screen',
//     arguments: message,
//   );
// }

// Future intiPushNotifications() async {
//   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

//   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
// }
