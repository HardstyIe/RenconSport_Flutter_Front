import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Center(
              child: Text('Connectez-vous!', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            buildTextField('Votre email : ', 'email@exemple.com', emailController),
            buildTextField('Votre mot de passe : ', 'Mot de passe', passwordController),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await sendLoginData();
                  // Ajoutez ici la logique pour rediriger vers la page d'accueil ou afficher un message d'erreur
                }
              },
              child: Text("Connexion"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      children: [
        Text(label),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez remplir ce champ";
              }
              return null;
            },
            obscureText: label.contains("Mot de passe"), // Masquer le mot de passe
            decoration: InputDecoration(
              hintText: hint,
              fillColor: CustomTheme.tertiaryColor,
              filled: true,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<void> sendLoginData() async {
    try {
      final Dio dio = Dio();
      final Map<String, dynamic> loginData = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      final Response response = await dio.post(
        'http://localhost:3000/auth/login', // Remplacez par l'URL de votre backend
        data: loginData,
      );

      if (response.statusCode == 200) {
        // Connexion réussie, ajoutez ici la logique pour rediriger vers la page d'accueil
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Connexion réussie")));
        Navigator.pushNamed(context, '/homepage');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Échec de la connexion'),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur inattendue: $error'),
        ),
      );
    }
  }
}
