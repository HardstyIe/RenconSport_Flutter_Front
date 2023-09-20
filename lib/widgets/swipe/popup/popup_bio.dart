import 'package:flutter/material.dart';

class PopupBio extends StatelessWidget {
  const PopupBio({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_drop_down_circle_rounded),
      color: Theme.of(context).primaryColor,
      iconSize: 60,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 250,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        iconSize: 40,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_drop_down_sharp)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Pseudo'), Text('Age :')],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(3)),
                        Icon(Icons.mail),
                        Padding(padding: EdgeInsets.all(5)),
                        Text('E-mail :')
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Padding(padding: EdgeInsets.all(3)),
                    //     Icon(Icons.phone_android),
                    //     Padding(padding: EdgeInsets.all(5)),
                    //     Text('Tél :')
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Padding(padding: EdgeInsets.all(3)),
                    //     Icon(Icons.location_on),
                    //     Padding(padding: EdgeInsets.all(5)),
                    //     Text('Localisation :'),
                    //   ],
                    // ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 90,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor,
                          offset: Offset(0, 0),
                        ),
                      ]),
                      child: Text('Bio'),
                      alignment: Alignment.topCenter,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
