import 'package:flutter/material.dart';
import 'package:renconsport/widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: Image(
                image: AssetImage('sport-demo.jpg'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 55,
                  color: Colors.red,
                  onPressed: () {},
                ),
                IconButton(
                    padding: EdgeInsets.only(top: 20),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 70,
                    onPressed: () {},
                  ),
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_sharp),
                  iconSize: 50,
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
