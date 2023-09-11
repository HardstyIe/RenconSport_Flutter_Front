import 'package:renconsport/models/user.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  static const url = "http://localhost:3000/auth/login";
  static final Dio _dio = Dio();

  static Future<User?> loginUser(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.get(url, data: userData);

      if (response.statusCode == 200) {
        final userDataJson = response.data as Map<String, dynamic>;
        final user = User.fromJson(userDataJson);
        return user;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}