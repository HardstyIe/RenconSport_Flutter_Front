import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renconsport/models/training/training_details.dart';
import 'package:renconsport/models/user/user.dart' as custom_user; // Utilisez un préfixe pour votre classe User personnalisée
import 'package:renconsport/models/user/user.dart';
import 'package:renconsport/screens/authentification/register.dart';
import 'package:renconsport/screens/homepage/home.dart';
import 'package:renconsport/services/authentifications/authentificationService.dart';
import 'package:renconsport/services/authentifications/googleAuthService.dart';
import 'package:renconsport/services/trainings/trainingService.dart';
import 'package:renconsport/services/users/userService.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/text_widget_form.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
            buildTextField('Votre email : ', 'email@example.com',
                emailController, context),
            buildTextField('Votre mot de passe : ', 'Mot de passe',
                passwordController, context,
                obscureText: true),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() &&
                    (EmailValidator.validate(emailController.text) == true)) {
                  final firebaseUser = await AuthentificationServices.loginUser({
                    "email": emailController.text,
                    "password": passwordController.text
                  }, context);
                  if (firebaseUser != null) {
                    custom_user.User? customUser =
                    await UserServices.getPersonalInfo();

                    ref.read(userProvider.notifier).updateUser(customUser!);

                    List<TrainingDetail> newTrainingDetails =
                    await TrainingService.getAllTraining();

                    ref
                        .read(trainingDetailProvider.notifier)
                        .updateTrainingDetails(newTrainingDetails);

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
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () async {
                await GoogleAuthService().signInWithGoogle();
                if (FirebaseAuth.instance.currentUser != null) {
                  final firebaseUser = FirebaseAuth.instance.currentUser;
                  final customUser = await UserServices.getPersonalInfo();

                  ref.read(userProvider.notifier).updateUser(customUser!);

                  List<TrainingDetail> newTrainingDetails =
                  await TrainingService.getAllTraining();

                  ref
                      .read(trainingDetailProvider.notifier)
                      .updateTrainingDetails(newTrainingDetails);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erreur lors de la connexion avec Google'),
                    ),
                  );
                }
              },
              child: Text(
                "Se connecter avec Google",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
