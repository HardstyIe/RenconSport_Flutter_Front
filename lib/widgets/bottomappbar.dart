import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.onTap});
  final Function onTap;

  static final List<IconData> icons = [
    Icons.home,
    Icons.account_circle,
    Icons.message,
    Icons.fitness_center,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: icons.map((e) {
            int index = icons.indexOf(e);
            return IconButton(onPressed: () => onTap(index), icon: Icon(e));
          }).toList()),
    );
  }
}
