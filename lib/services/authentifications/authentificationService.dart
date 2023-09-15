import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/constants/auth.dart';
import 'package:renconsport/models/user.dart';

class AuthentificationServices {
  static const url = Api.NESTJS_BASE_URL;
  static const register = "auth/register";
  static const login = "auth/login";
  static const logout = "auth/logout";
  static final Dio _dio = Dio();

  static Future<User?> registerUser(
      Map<String, dynamic> userData, BuildContext context) async {
    try {
      final response = await _dio.post(
        url + register,
        data: userData,
      );

      if (response.statusCode == 200) {
        final userDataJson = response.data as Map<String, dynamic>;
        final user = User.fromJson(userDataJson);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Inscription réussie")));
        return user;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Échec de l\'inscription'),
          ),
        );
        return null;
      }
    } catch (error) {
      print("Erreur lors de l'inscription: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de l\'inscription'),
        ),
      );
      return null;
    }
  }

  static Future<User?> loginUser(
      Map<String, dynamic> userData, BuildContext context) async {
    try {
      final response = await _dio.post(
        url + login,
        data: userData,
      );

      if (response.statusCode == 200) {
        final userDataJson = response.data as Map<String, dynamic>;

        final user = User.fromJson(userDataJson);
        String token = userDataJson['result']['token'];

        // Stockez le token dans le singleton
        GlobalData().setToken(token);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Connexion réussie")));
        return user;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Échec de la connexion'),
          ),
        );
        return null;
      }
    } catch (error) {
      print('Erreur lors de la connexion: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de la connexion'),
        ),
      );
      return null;
    }
  }
}
