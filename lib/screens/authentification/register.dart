import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renconsport/screens/authentification/login.dart';
import 'package:renconsport/services/authentifications/authentificationService.dart';
import 'package:renconsport/services/authentifications/googleAuthService.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/text_widget_form.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Center(
                child: Text('Inscrivez-vous!', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Laissez-nous être votre partenaire pour vivre des aventures sportives inoubliables tout en faisant des rencontres enrichissantes !',
                  textAlign: TextAlign.center,
                ),
              ),
              buildTextField(
                  'Votre email : ', 'Email', emailController, context),
              buildTextField('Votre mot de passe : ', 'Mot de passe',
                  passwordController, context,
                  obscureText: true),
              Padding(
                padding: EdgeInsets.all(10.0),
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
                    Text('Accepter les conditions générales d\'utilisation'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      isChecked &&
                      (EmailValidator.validate(emailController.text) == true)) {
                    await AuthentificationServices.registerUser({
                      "email": emailController.text,
                      "password": passwordController.text,
                    }, context);
                  }
                },
                child: Text("Inscription"),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('Déjà inscrit ? Connectez-vous !'),
              ),
              SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}