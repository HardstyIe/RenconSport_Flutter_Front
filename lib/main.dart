import 'package:flutter/material.dart';
import 'package:renconsport/screens/authentification/register.dart';
import 'package:renconsport/screens/homepage/home.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/bottomappbar.dart';
import 'package:firebase_core/firebase_core.dart'; // Ajoutez cette importation
import 'package:firebase_messaging/firebase_messaging.dart'; // Ajoutez cette importation

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.defaultTheme,
      home: Scaffold(
        body: Home(),
        appBar: CustomAppBar(
          showBackButton: false,
        ),
      ),
    );
  }
}
