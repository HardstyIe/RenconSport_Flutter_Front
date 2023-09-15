import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/api/firebase_api.dart';
import 'package:renconsport/screens/authentification/register.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/bottomappbar.dart';

void main() async {
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
        body: RegisterPage(),
        appBar: CustomAppBar(showBackButton: false,),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
