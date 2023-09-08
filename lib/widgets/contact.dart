import 'package:flutter/material.dart';

void main() {
  runApp(RenconSportApp());
}

class RenconSportApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactez-nous'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nous Contacter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Vous avez des questions, des suggestions ou des commentaires ? Contactez-nous en utilisant le formulaire ci-dessous.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nom complet',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Adresse e-mail',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Message',
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logic to send the contact form data
                // You can implement the logic to send the message here
                // For this example, we'll just print the form data.
                print('Name: [NameFieldText]');
                print('Email: [EmailFieldText]');
                print('Message: [MessageFieldText]');
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
