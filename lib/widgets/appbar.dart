import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  CustomAppBar({required this.showBackButton});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: SizedBox(
        width: 140,
        height: 160,
        child: Image.asset(
          'assets/LogoGood.png',

        ),
      ),
      centerTitle: true,

      leading: showBackButton
          ? IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      )
          : null,
    );
  }
}
