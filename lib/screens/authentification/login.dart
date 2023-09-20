import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:renconsport/models/user/user.dart'; // Assurez-vous que cet import est correct
import 'package:renconsport/screens/authentification/register.dart';
import 'package:renconsport/screens/homepage/home.dart';
import 'package:renconsport/services/authentifications/authentificationService.dart';
import 'package:renconsport/services/users/userService.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/text_widget_form.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
      appBar: CustomAppBar(showBackButton: true),
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
                    User? newUser = await UserServices.getPersonalInfo();

                    ref.read(userProvider.notifier).updateUser(newUser!);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erreur lors de la connexion'),
                      ),
                    );
                  }
                }
              },
              child: Text("Connexion"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text('Pas encore inscrit ? Enregistrez-vous !'),
            ),
          ],
        ),
      ),
    );
  }
}
