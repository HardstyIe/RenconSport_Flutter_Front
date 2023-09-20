import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/constants/auth.dart';

class UserChatGroupService {
  static const url = Api.NESTJS_BASE_URL;
  static const allUserChatGroup = "chatgroup";
  static const userChatGroup = "chatgroup/:id";
  static const sendUserChatGroup = "chatgroup/:id";
  static const putUserChatGroup = "chatgroup/:id";
  static const delUserChatGroup = "chatgroup/:id";

  static final Dio _dio = Dio();
  static final storage = FlutterSecureStorage(); // Ajouté

  static Future<String?> getToken() async {
    return await storage.read(key: 'authToken'); // Ajouté
  }

  static Future<List<dynamic>> getAllUserChatGroup() async {
    try {
      String? token = await getToken(); // Ajouté
      if (token == null) return [];

      final response = await _dio.get(
        url + allUserChatGroup,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> userChatGroupDataList =
            response.data as List<dynamic>;
        return userChatGroupDataList;
      } else {
        throw Exception('Failed to fetch userChatGroups');
      }
    } catch (error) {
      throw Exception('Failed to fetch userChatGroups: $error');
    }
  }

  static Future<Map<String, dynamic>?> getUserChatGroup(String id) async {
    try {
      String? token = await getToken();
      if (token == null) return null;

      final response = await _dio.get(
        url + userChatGroup.replaceAll(':id', id),
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> userChatGroupDataJson =
            response.data as Map<String, dynamic>;
        return userChatGroupDataJson;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> createUserChatGroup(
      Map<String, dynamic> userChatGroupData) async {
    try {
      String? token = await getToken();

      final response = await _dio.post(
        url + sendUserChatGroup,
        data: userChatGroupData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final userChatGroupDataJson = response.data as Map<String, dynamic>;
        final userChatGroup = userChatGroupDataJson;
        return userChatGroup;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> updateUserChatGroup(
      String id, Map<String, dynamic> userChatGroupData) async {
    try {
      String? token = await getToken();

      final response = await _dio.put(
        url + putUserChatGroup.replaceAll(':id', id),
        data: userChatGroupData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final userChatGroupDataJson = response.data as Map<String, dynamic>;
        final userChatGroup = userChatGroupDataJson;
        return userChatGroup;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> deleteUserChatGroup(String id) async {
    try {
      String? token = await getToken();

      final response = await _dio.delete(
        url + delUserChatGroup.replaceAll(':id', id),
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final userChatGroupDataJson = response.data as Map<String, dynamic>;
        final userChatGroup = userChatGroupDataJson;
        return userChatGroup;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
