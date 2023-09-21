import 'package:flutter/material.dart';
import 'package:renconsport/services/groups/messages/messageService.dart';
import 'package:renconsport/services/messages/messageService.dart';

class ComposeMessagePage extends StatefulWidget {
  @override
  _ComposeMessagePageState createState() => _ComposeMessagePageState();
}

class _ComposeMessagePageState extends State<ComposeMessagePage> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() async {
    final messageContent = _messageController.text;

    if (messageContent.isNotEmpty) {
      final messageData = {
        "chatGroupId": "chatGroupId",
        "senderId": "senderId",
        "content": messageContent,
        "sendAt": DateTime.now().toIso8601String(),
      };

      final sentMessage = await MessageService.sendMessage(messageData);

      if (sentMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Message envoyé'),
          ),
        );

        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Échec de l\'envoi du message'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _messageController,
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Contenu du message'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
