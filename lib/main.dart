import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/homepage/homepage.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/connexion/connexion.dart';

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
        theme:  CustomTheme.defaultTheme,
        home: Scaffold(
          body: HomePage(),
          appBar: CustomAppBar(),


        ),


    );
  }
}
