import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  const SwipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                iconSize: 55,
                color: Colors.red,
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.only(bottom: 0),
                icon: Icon(Icons.arrow_drop_down_circle_rounded),
                color: Theme.of(context).primaryColor,
                iconSize: 60,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.thumb_up_alt_sharp),
                iconSize: 50,
                color: Colors.blue,
                onPressed: () {},
              ),
            ]),
        height: MediaQuery.of(context).size.width * 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/muscu.png'), fit: BoxFit.cover)));
  }
}
