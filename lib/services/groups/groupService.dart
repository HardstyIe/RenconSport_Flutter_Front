import 'package:dio/dio.dart';
import 'package:renconsport/constants/auth.dart';

class UserChatGroupService {
  static const url = Api.NESTJS_BASE_URL;
  static const allUserChatGroup = "chatgroup";
  static const userChatGroup = "chatgroup/:id";
  static const sendUserChatGroup = "chatgroup/:id";
  static const putUserChatGroup = "chatgroup/:id";
  static const delUserChatGroup = "chatgroup/:id";

  static final Dio _dio = Dio();

  static Future<List<dynamic>> getAllUserChatGroup() async {
    try {
      final response = await _dio.get(url + allUserChatGroup);

      if (response.statusCode == 200) {
        final List<dynamic> userChatGroupDataList =
            response.data as List<dynamic>;
        final List<dynamic> userChatGroups = userChatGroupDataList.map((data) {
          return data;
        }).toList();
        return userChatGroups;
      } else {
        throw Exception('Failed to fetch userChatGroups');
      }
    } catch (error) {
      throw Exception('Failed to fetch userChatGroups: $error');
    }
  }

  static Future<Map<String, dynamic>?> getUserChatGroup(String id) async {
    try {
      final response =
          await _dio.get(url + userChatGroup.replaceAll(':id', id));

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

  static Future<dynamic> createUserChatGroup(
      Map<String, dynamic> userChatGroupData) async {
    try {
      final response =
          await _dio.post(url + sendUserChatGroup, data: userChatGroupData);

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
      final response = await _dio.put(
        url + putUserChatGroup.replaceAll(':id', id),
        data: userChatGroupData,
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
      final response =
          await _dio.delete(url + delUserChatGroup.replaceAll(':id', id));

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
