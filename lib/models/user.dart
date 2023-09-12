import 'dart:ffi';

class User {
  final String user_id;
  final String email;
  final String first_name;
  final String last_name;
  final String password;
  final Int birthday;
  final String location;
  final String phone;

  User(this.user_id, this.email, this.first_name, this.last_name, this.password,
      this.birthday, this.location, this.phone);

  User.fromJson(Map<String, dynamic> json)
      : user_id = json["id"],
        email = json["email"],
        first_name = json["first_name"],
        last_name = json["last_name"],
        password = json["password"],
        birthday = json["birthday"],
        location = json["location"],
        phone = json["phone"];
}
