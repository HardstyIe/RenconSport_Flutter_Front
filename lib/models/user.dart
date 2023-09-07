import 'dart:ffi';

class User {
  final String user_id;
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final Int birthday;
  final String location;
  final String phone;

  User(this.user_id, this.email, this.firstName,
      this.lastName, this.password, this.birthday,
      this.location, this.phone);




  User.fromJson(Map<String, dynamic> json):
        user_id = json["id"],
        email = json["email"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        password = json["password"],
        birthday = json["birthday"],
        location = json["location"],
        phone = json["phone"];

}