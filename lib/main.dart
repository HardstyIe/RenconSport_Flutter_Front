import 'package:flutter/material.dart';
import 'package:renconsport/screens/homepage/homepage.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
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
        body: HomePage(),
        appBar: CustomAppBar(),
      ),
    );
  }
}
// Initialize App for email register with Firebase
final Future<FirebaseApp> _initialization = Firebase.initializeApp();