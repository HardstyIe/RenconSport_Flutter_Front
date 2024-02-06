import 'package:flutter/material.dart';
import 'package:renconsport/models/user/user.dart';
import 'package:renconsport/services/users/userService.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<User>? users;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    final userList = await UserServices.getAllUserInfo();
    setState(() {
      users = userList as List<User>?;
    });
    print("Users loaded: ${users?.length ?? 0} users");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          child: ListView.builder(
            itemCount: users?.length ?? 0,
            itemBuilder: (context, index) {
              final user = users![index];
              print("User $index: ${user.email}");

              return ListTile(
                leading: CircleAvatar(
                  // Utilisez la photo de profil de l'utilisateur ici
                  backgroundColor: Colors.grey,
                ),
                title: Text('${user.firstName} ${user.lastName}'), // Affiche le prénom et le nom
                subtitle: Text(user.email ?? ''),
                onTap: () {

                },
              );
            },
          ),
        ),
      ],
    );
  }
}
 