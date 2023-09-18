import 'package:flutter/material.dart';
import 'package:renconsport/screens/chat/messagingpage.dart';
import 'package:renconsport/screens/homepage/home.dart';
import 'package:renconsport/screens/profile/profile.dart';
import 'package:renconsport/screens/training/training.dart';

class CustomBottomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (value == 0)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          if (value == 1)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          if (value == 2)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MessagingPage()));
          if (value == 3)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Training()));
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: '',
          ),
        ]);
  }
}
