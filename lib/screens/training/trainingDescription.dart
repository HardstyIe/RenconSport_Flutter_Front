import 'package:flutter/material.dart';
import 'package:renconsport/widgets/appbar.dart';

class TrainingDescription extends StatefulWidget {
  const TrainingDescription({super.key});

  @override
  State<TrainingDescription> createState() => _TrainingDescriptionState();
}

class _TrainingDescriptionState extends State<TrainingDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                child: Text(
                  "Nom du sport pratiqué (api call)",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.red,
                width: 300,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Adresse : apicall location"),
                    Text("Organisateur : apicall organisateurname"),
                    Text("Description : training description"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(onPressed: () {}, child: Text("AJOUTER"),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.bodyLarge),

              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green),
    ),
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
