import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:renconsport/models/user/user.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 350,
          width: double.infinity,
          child: Image.asset(
            'assets/${user.avatar}',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${user.firstName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Âge : ${user.birthday}',
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
              'Email: ${user.email}',
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
            Icon(Icons.phone),
            SizedBox(width: 4),
            Text(
              'Telephone : ${user.phoneNumber}',
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
              'Placeholder adresse',
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
            'Description : ${user.biography}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
