import 'package:flutter/material.dart';
import 'package:renconsport/screens/authentification/register.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/bottomappbar.dart';

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
        body: RegisterPage(),
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
