class User {
  final String? user_id;
  final String? email;
  final String? password;

  User(
    this.user_id,
    this.email,
    this.password,
  );

  User.fromJson(Map<String, dynamic> json)
      : user_id = json["id"] as String?,
        email = json["email"] as String?,
        password = json["password"] as String?;
}
