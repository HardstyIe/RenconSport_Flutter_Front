import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }

  void subscribeToTokenRefresh(void Function(String) onRefresh) {
    _firebaseMessaging.onTokenRefresh.listen((String newToken) {
      onRefresh(newToken);
    });
  }

  // Initialisez Firebase Messaging (si nécessaire)
  void initializeFirebaseMessaging() {
    // Ajoutez ici toute initialisation supplémentaire de Firebase Messaging si nécessaire
  }
}
