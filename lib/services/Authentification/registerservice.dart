import 'package:dio/dio.dart';
import 'package:renconsport/models/user.dart';

class RegisterService {
  static const url = "http://localhost:3000/auth/register";
  static final Dio _dio = Dio();

  static Future<User?> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post(url, data: userData);

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
