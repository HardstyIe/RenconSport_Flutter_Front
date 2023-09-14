import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/screens/homepage/home.dart';
import 'package:renconsport/services/authentification/authentificationService.dart';
import 'package:renconsport/services/users/userService.dart';
import 'package:renconsport/widgets/text_widget_form.dart';

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
      appBar: AppBar(),
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
            buildTextField('Votre email : ', 'email@exemple.com',
                emailController, context),
            buildTextField('Votre mot de passe : ', 'Mot de passe',
                passwordController, context,
                obscureText: true),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() &&
                    (EmailValidator.validate(emailController.text) == true)) {
                  final user = await AuthentificationServices.loginUser({
                    "email": emailController.text,
                    "password": passwordController.text
                  }, context);

                  if (user != null) {
                    await UserServices.getPersonalInfo();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                }
              },
              child: Text("Connexion"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Pas encore inscrit ? Enregistrez-vous !'),
            ),
          ],
        ),
      ),
    );
  }
}
