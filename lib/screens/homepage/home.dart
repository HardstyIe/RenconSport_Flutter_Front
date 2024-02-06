import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/provider/state.dart';
import 'package:renconsport/widgets/appbar.dart';
import 'package:renconsport/widgets/bottomappbar.dart';
import 'package:renconsport/widgets/message/message_widget.dart';
import 'package:renconsport/widgets/profile/profile_widget.dart';
import 'package:renconsport/widgets/swipe/swipe.dart';
import 'package:renconsport/widgets/training/training_widget.dart';
import 'package:renconsport/services/notifications/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
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
    final index = ref.watch(currentIndexProvider);

    List<Widget> widgets = [
      SwipeCard(),
      Profile(),
      MessagePage(),
      TrainingList()
    ];

    return Scaffold(
      appBar: CustomAppBar(showBackButton: true),
      body: widgets[index],
      bottomNavigationBar: CustomNavigationBar(
        onTap: (newIndex) {
          ref.read(currentIndexProvider.notifier).state = newIndex;
        },
      ),
    );
  }
}
