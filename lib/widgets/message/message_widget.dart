import 'package:flutter/material.dart';
import 'package:renconsport/models/user/user.dart';
import 'package:renconsport/services/users/userService.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<User>? users;

  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    final userList = await UserServices.getAllUserInfo();
    setState(() {
      users = userList as List<User>?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50,
        color: Color(0xFFEEECDE),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Text('Renconsport'),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
      ),
      Container(
        height: 50,
        color: Color(0xFFEEECDE),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt_outlined),
            ),
            TextButton(
              child: const Text('Discussions'),
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            TextButton(
              child: const Text('Statut'),
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            TextButton(
              child: const Text('Activités'),
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
      Expanded(
          child: users != null && users!.isNotEmpty
              ? ListView.builder(
                  itemCount: users!.length,
                  itemBuilder: (context, index) {
                    final user = users![index];
                    return ListTile(
                      title: Text(user.email ?? ''),
                      subtitle: Text(user.email ?? ''),
                      // Ajoutez d'autres champs d'utilisateur que vous souhaitez afficher ici.
                    );
                  },
                )
              : (Center(
                  child: Text(
                    'Aucun message',
                    style: TextStyle(fontSize: 24),
                  ),
                )))
    ]);
  }
}
