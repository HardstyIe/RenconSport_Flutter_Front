import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    firstNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              widthFactor: MediaQuery.of(context).size.width,
              child: Text(
                'Laissez-nous être votre partenaire pour vivre des aventures sportives inoubliables tout en faisant des rencontres enrichissantes ! ',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Votre nom : ",
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: CustomTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: nameController, // Associez le contrôleur au champ de texte
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez remplir le champ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Duchemin',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Votre prénom : "),
          SizedBox(height: 15),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: CustomTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: firstNameController, // Associez le contrôleur au champ de texte
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez remplir le champ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Denis',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Votre email : "),
          SizedBox(height: 15),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: CustomTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez remplir le champ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'email@boite.fr',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Votre numéro de téléphone : "),
          SizedBox(height: 15),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: CustomTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez remplir le champ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: '01 23 45 67 89',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Votre mot de passe : "),
          SizedBox(height: 15),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: CustomTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true, // Pour masquer le mot de passe
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez remplir le champ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  'Accepter les conditions générales d\'utilisation',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              activate();
            },
            child: Text("Inscription"),
          ),
        ],
      ),
    );
  }

  void activate() {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String firstName = firstNameController.text;
      String email = emailController.text;
      String phone = phoneController.text;
      String password = passwordController.text;

      print("Nom: $name");
      print("Prénom: $firstName");
      print("Email: $email");
      print("Téléphone: $phone");
      print("Mot de passe: $password");
      print("Conditions générales d'utilisation acceptées: $isChecked");

      // Code d'envoi au serveur
    }
  }
}
