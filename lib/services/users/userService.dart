import 'package:dio/dio.dart';
import 'package:renconsport/constants/auth.dart';
import 'package:renconsport/models/user.dart';

class UserServices {
  static const String url = Api.NESTJS_BASE_URL;
  static const String personalUserInfo = "users/me";
  static const String allUserInfo = "users";
  static const String userInfo = "users/:id";

  static final Dio _dio = Dio();

  static Future<User?> getPersonalInfo() async {
    try {
      String? token = GlobalData().getToken();
      if (token == null) {
        print("Token est null");
        return null;
      }

      final response = await _dio.get(
        url + personalUserInfo,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        final userDataJson = response.data as Map<String, dynamic>;
        final user = User.fromJson(userDataJson);
        return user;
      }
    } catch (error) {
      print("Erreur lors de la récupération des infos utilisateur: $error");
      return null;
    }
  }

  static Future<List<User>?> getAllUserInfo() async {
    try {
      String? token = GlobalData().getToken();
      if (token == null) {
        print("Token est null");
        return null;
      }

      final response = await _dio.get(
        url + allUserInfo,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      print("Code de réponse de l'API : ${response.statusCode}");

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        print("Données renvoyées par l'API : $responseData");

        if (responseData is Map<String, dynamic> && responseData.containsKey('result')) {
          final List<dynamic> userDataList = responseData['result'];
          final List<User> userList = userDataList.map((userData) => User.fromJson(userData)).toList();
          print("Liste d'utilisateurs récupérée avec succès: $userList");
          return userList;
        } else {
          print("Les données renvoyées ne contiennent pas de champ 'result' ou ce champ n'est pas une liste.");
          return null;
        }
      }
    } catch (error) {
      print("Erreur lors de la récupération des infos utilisateur: $error");
      return null;
    }
  }



  static Future<User?> getOneUserInfo() async {
    try {
      String? token = GlobalData().getToken();
      if (token == null) {
        print("Token est null");
        return null;
      }

      final response = await _dio.get(
        url + userInfo,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        final userDataJson = response.data as Map<String, dynamic>;
        final user = User.fromJson(userDataJson);
        return user;
      }
    } catch (error) {
      print("Erreur lors de la récupération des infos utilisateur: $error");
      return null;
    }
  }

  static Future<User?> updateUserInfo() async {
    try {
      String? token = GlobalData().getToken();
      if (token == null) {
        print("Token est null");
        return null;
      }

      final response = await _dio.get(
        url + userInfo,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        final userDataJson = response.data as Map<String, dynamic>;
        final user = User.fromJson(userDataJson);
        return user;
      }
    } catch (error) {
      print("Erreur lors de la récupération des infos utilisateur: $error");
      return null;
    }
  }

  static Future<User?> patchUserInfo() async {
    try {
      String? token = GlobalData().getToken();
      if (token == null) {
        print("Token est null");
        return null;
      }

      final response = await _dio.get(
        url + userInfo,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        final userDataJson = response.data as Map<String, dynamic>;
        final user = User.fromJson(userDataJson);
        return user;
      }
    } catch (error) {
      print("Erreur lors de la récupération des infos utilisateur: $error");
      return null;
    }
  }
}
