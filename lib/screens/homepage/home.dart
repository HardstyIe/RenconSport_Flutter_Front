import 'package:flutter/material.dart';
import 'package:renconsport/screens/authentification/login.dart';
import 'package:renconsport/screens/authentification/register.dart';
import 'package:renconsport/widgets/bottomappbar.dart';
import 'package:renconsport/widgets/message/message_widget.dart';
import 'package:renconsport/widgets/profile/profile_widget.dart';
import 'package:renconsport/widgets/swipe/tinder_like.dart';
import 'package:renconsport/widgets/training/training_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> widgets = [
    SwipeCard(),
    Profile(),
    MessagePage(),
    TrainingList()
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: widgets[_currentIndex],
        bottomNavigationBar: CustomNavigationBar(
          onTap: changePage,
        ));
  }

  void changePage(index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }
}
