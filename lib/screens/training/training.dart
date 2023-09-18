import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/bottomappbar.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: true),
      body: Center(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset( //image a venir chercher via l'api
                    'assets/sport-demo.jpg',
                    width: 50,
                    height: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      color: CustomTheme.primaryColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Pseudo: Stephane_59", // Remplacez par le pseudo reel dans l'API
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Lieu:   Paris", // Remplacez par le lieu reel dans l'API
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Date de création: 01/09/2023", // Remplacez par la date de création réelle dans l'API
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Date de fin: 30/09/2023", // Remplacez par la date de fin réelle dans l'API
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Voir +", // redirection vers la Page decription de l'activités
                    style: TextStyle(
                      color: CustomTheme.primaryColor, // Couleur personnalisée pour le texte
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5), // Espace entre le texte et l'icône
                  Icon(
                    Icons.visibility,
                    color: CustomTheme.primaryColor, // Couleur personnalisée pour l'icône
                  ),
                ],
              ),
              BottomAppBar(
                child: CustomBottomNavigationBar(),

              ),
            ],
          ),
        ),

      ),
    );
  }
}