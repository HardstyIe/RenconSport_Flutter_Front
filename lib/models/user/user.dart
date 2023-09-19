import 'package:hooks_riverpod/hooks_riverpod.dart';

class User {
  final String? user_id;
  final String? email;
  final String? password;
  final String? first_name;
  final String? last_name;

  User(
    this.user_id,
    this.email,
    this.password,
    this.first_name,
    this.last_name,
  );

  User.fromJson(Map<String, dynamic> json)
      : user_id = json["id"] as String?,
        email = json["email"] as String?,
        password = json["password"] as String?,
        first_name = json["first_name"] as String?,
        last_name = json["last_name"] as String?;
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(User(null, null, null, null, null));
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier(User user) : super(user);

  void setUser(User user) {
    state = user;
  }

  void updateUser(User newUser) {
    state = newUser;
  }
}
