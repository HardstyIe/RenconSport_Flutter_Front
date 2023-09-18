import 'package:flutter/material.dart';
import 'package:renconsport/models/message.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/messages/messageService.dart';
import 'package:renconsport/services/users/userService.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/screens/chat/composemessagepage.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({Key? key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  List<User>? users;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    final userList = await UserServices.getAllUserInfo();
    setState(() {
      users = userList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: true),
      body: Column(
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
                : FutureBuilder<List<Message>>(
              future: MessageService.fetchMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        'Une erreur s\'est produite : ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('Aucun message à afficher.'),
                  );
                } else {
                  final messages = snapshot.data!;
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ListTile(
                        title: Text(message.content),
                        subtitle: Text(message.senderId),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ComposeMessagePage(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
