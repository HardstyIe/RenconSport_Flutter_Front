import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateOfBirthController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Laissez-nous être votre partenaire pour vivre des aventures sportives inoubliables tout en faisant des rencontres enrichissantes !',
                textAlign: TextAlign.center,
              ),
            ),
            buildTextField('Votre prénom : ', 'Prenom', firstNameController),
            buildTextField('Votre nom de famille : ', 'Nom de famille',
                lastNameController),
            buildTextField(
                'Votre email : ', 'email@exemple.com', emailController, backgroundColor: CustomTheme.tertiaryColor),
            buildTextField('Votre date de naissance : ', 'JJ/MM/AAAA',
                dateOfBirthController,
                isDateField: true),
            buildTextField(
                'Votre mot de passe : ', 'Mot de passe', passwordController, backgroundColor: CustomTheme.tertiaryColor),
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
                  Text('Accepter les conditions générales d\'utilisation'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() && isChecked) {
                  await sendRegistrationData();
                  // Ici, ajoutez la logique pour rediriger vers /login ou afficher une Snackbar
                }
              },
              child: Text("Inscription"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, String hint, TextEditingController controller,
      {bool isDateField = false, Color? backgroundColor}) {
    return Column(
      children: [
        Text(label),
        SizedBox(height: 15),
        GestureDetector(
          onTap: isDateField ? () => _selectDate(context) : null,
          child: AbsorbPointer(
            absorbing: isDateField,
            child: Container(
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
                decoration: InputDecoration(
                  hintText: hint,
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
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<void> sendRegistrationData() async {
    try {
      final Dio dio = Dio();
      final Map<String, dynamic> userData = {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'email': emailController.text,
        'birthday': selectedDate.millisecondsSinceEpoch ~/
            1000,
        'password': passwordController.text,
      };

      final Response response = await dio.post(
        'http://localhost:3000/auth/register',
        data: userData,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Inscription réussie'),
          ),
        );
        Navigator.pushNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Échec de l\'inscription'),
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
