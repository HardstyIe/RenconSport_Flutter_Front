import 'package:flutter/material.dart';
import 'package:renconsport/screens/authentification/login.dart';
import 'package:renconsport/screens/authentification/register.dart';
import 'package:renconsport/services/notifications/notification_service.dart';
import 'package:renconsport/widgets/bottomappbar.dart';
import 'package:renconsport/widgets/message/message_widget.dart';
import 'package:renconsport/widgets/profile/profile_widget.dart';
import 'package:renconsport/widgets/swipe/tinder_like.dart';
import 'package:renconsport/widgets/training/training_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> widgets = [
    SwipeCard(),
    Profile(),
    MessagePage(),
    TrainingList()
  ];

  int _currentIndex = 0;

  // Firebase Messaging
  final NotificationService _notificationService = NotificationService();
  String? _fcmToken;

  @override
  void initState() {
    super.initState();

    _notificationService.getFCMToken().then((token) {
      setState(() {
        _fcmToken = token;
      });
      print("Firebase Messaging Token: $_fcmToken");
    });

    _notificationService.subscribeToTokenRefresh((String newToken) {
      setState(() {
        _fcmToken = newToken;
      });
      print("Nouveau Firebase Messaging Token après rafraîchissement: $_fcmToken");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        onTap: changePage,
      ),
    );
  }

  void changePage(index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }
}
