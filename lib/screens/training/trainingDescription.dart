import 'package:flutter/material.dart';

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

            TextButton(
              onPressed: () {},
              child: Text("AJOUTER"),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.bodyLarge),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("SUPPRIMER"),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.bodyLarge),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            TextButton(
              onPressed: () {},
              child: Text("MODIFIER"),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.bodyLarge),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Derniers avis : ",
                style: Theme.of(context).textTheme.bodyLarge),
            // Add notation system if we can (stars)
            SizedBox(
              height: 20,
            ),
            Text("Training description from API",
                style: Theme.of(context).textTheme.bodyLarge),
            // BottomNavigationBar(
            // CustomeBottomNavigationBar(), ? (utiliser celle que Fabien a fait, ne pas oublier de l'importer)
            // ),
          ],
        ),
      ),
    );
  }
}
