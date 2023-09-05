import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Inscrivez vous!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 20, // Espace entre le titre et le texte principal
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Espacement des côtés
            child: Center(
              widthFactor: MediaQuery.of(context).size.width,
              child: Text(
                'Rejoignez notre communauté passionnée de sport et faites des rencontres dès maintenant ! Laissez-nous être votre partenaire pour vivre des aventures sportives inoubliables tout en faisant des rencontres enrichissantes ! ',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Votre nom : ",
          style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 15,
          ),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez remplir le champs";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Benjamin',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                        color: Colors.green,
                    ),
                    ),
                  ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
