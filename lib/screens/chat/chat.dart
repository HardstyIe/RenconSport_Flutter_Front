import 'package:flutter/material.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              child: SearchBar(
                leading: Text('RenconSport'),
                trailing: <Widget>[
                  Icon(Icons.search),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
                TextButton(child: const Text('Discutions'), onPressed: () {}),
                TextButton(child: const Text('Statut'), onPressed: () {}),
                TextButton(child: const Text('Activités'), onPressed: () {}),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Image(image: AssetImage('avatar.png')),
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      child: Text('Denis_59'),
                    ),
                    SizedBox(
                      child: Text('1'),
                    )
                  ],
                ),
                SizedBox(
                  child: Text("Merci j'ai adoré ce moment passé sur le court"),
                ),
                SizedBox(
                  child: IconButton(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(bottom: 0),
                    icon: Icon(Icons.message),
                    color: Colors.green,
                    iconSize: 45,
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ));
  }
}
