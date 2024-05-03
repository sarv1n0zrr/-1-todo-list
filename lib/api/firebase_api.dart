import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_to_do_list/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();

    print('Token:' + fCMToken.toString());
  }
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;

  navigatorKey.currentState?.pushNamed(
    '/notification_screen',
    arguments: message,
  );
}

Future intiPushNotifications() async {
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';

// class FirebaseApi {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initNotification() async {
//     try {
//       // Initialize Firebase (ensure this is done before using Firebase services)
//       await Firebase.initializeApp();

//       // Request permission for receiving notifications
//       await _firebaseMessaging.requestPermission();

//       // Retrieve the FCM token
//       String? fcmToken = await _firebaseMessaging.getToken();

//       // Print the FCM token
//       print('FCM Token: $fcmToken');
//     } catch (e) {
//       // Handle any errors that occur during initialization or token retrieval
//       print('Error initializing Firebase or retrieving FCM token: $e');
//     }
//   }
// }

// void main() async {
//   // ...

//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   String? token = await messaging.getToken();
//   print('FCM Token: $token');
// }
