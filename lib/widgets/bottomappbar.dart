import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
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
      ]    
    );
  }
}