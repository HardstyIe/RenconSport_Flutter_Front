import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';

class TrainingList extends StatelessWidget {
  const TrainingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              "Nos séances d'entraînements",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              decoration: BoxDecoration(
                  color: CustomTheme.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    //image a venir chercher via l'api
                    'assets/sport-demo.jpg',
                    width: 50,
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("data"),
                      Text("data"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
