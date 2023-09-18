import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Image.asset(
                'assets/Sport.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pseudo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Âge : 33', // Remplacez par l'âge réel
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.school),
                SizedBox(width: 4),
                Text(
                  'Niveau : bac + 5',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // Espacement entre les deux rangées
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.fitness_center),
                SizedBox(width: 4),
                Text(
                  'Passionné de football, de basket et de tennis',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // Espacement entre les deux rangées
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 4),
                Text(
                  'Paris, France',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.grey[400],
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Description : Mettez ici votre description personnelle. '
                    'Vous pouvez parler de vos hobbies, de vos intérêts, de vos objectifs, etc.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}