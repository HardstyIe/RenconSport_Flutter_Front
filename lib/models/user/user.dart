import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/models/group/message/message.dart';
import 'package:renconsport/models/training/training.dart';

class User {
  final String? id;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? biography;
  final DateTime? birthday;
  final bool? isAdmin;
  final String? avatar;
  final List<Training>? createdTrainings;
  final List<Training>? joinedTrainings;
  final List<Message>? messages;

  User({
    this.id,
    this.email,
    this.phoneNumber,
    this.password,
    this.firstName,
    this.lastName,
    this.biography,
    this.birthday,
    this.isAdmin,
    this.avatar,
    this.createdTrainings,
    this.joinedTrainings,
    this.messages,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      biography: json['biography'],
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      isAdmin: json['isAdmin'],
      avatar: json['avatar'],
      createdTrainings: json['createdTrainings'] != null
          ? (json['createdTrainings'] as List)
              .map((i) => Training.fromJson(i))
              .toList()
          : null,
      joinedTrainings: json['joinedTrainings'] != null
          ? (json['joinedTrainings'] as List)
              .map((i) => Training.fromJson(i))
              .toList()
          : null,
      messages: json['messages'] != null
          ? (json['messages'] as List).map((i) => Message.fromJson(i)).toList()
          : null,
    );
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(User());
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
