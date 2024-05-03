import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/auth/main_page.dart';
import 'package:flutter_to_do_list/firebase_options.dart';
import 'package:flutter_to_do_list/api/firebase_api.dart';
import 'package:flutter_to_do_list/screen/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main_Page(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}
