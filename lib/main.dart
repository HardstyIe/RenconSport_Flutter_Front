import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/screens/homepage/homepage.dart';
import 'package:renconsport/screens/messagingpage.dart';
import 'package:renconsport/screens/training/trainingDescription.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:renconsport/api/firebase_api.dart';



void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.defaultTheme,
      home: Scaffold(
        body: MessagingPage(),
        appBar: CustomAppBar(),
      ),
    );
  }
}

