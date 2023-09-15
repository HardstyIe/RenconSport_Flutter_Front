import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserHive {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
  final DateTime birthday;
  @HiveField(5)
  final String location;

  UserHive({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.location,
  });
}
