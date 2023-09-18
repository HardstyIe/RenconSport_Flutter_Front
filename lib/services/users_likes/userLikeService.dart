import 'package:dio/dio.dart';
import 'package:renconsport/constants/auth.dart';

class UserLikeServices {
  static const url = Api.NESTJS_BASE_URL;
  static const allUserLike = "likes";
  static const userLike = "likes/:id";
  static const sendUserLike = "likes/:id";
  static const putUserLike = "likes/:id";
  static const delUserLike = "likes/:id";

  static final Dio _dio = Dio();

  static Future<List<dynamic>> getAllUserLike() async {
    try {
      final response = await _dio.get(url + allUserLike);

      if (response.statusCode == 200) {
        final List<dynamic> userLikeDataList = response.data as List<dynamic>;
        final List<dynamic> userLikes = userLikeDataList.map((data) {
          return data;
        }).toList();
        return userLikes;
      } else {
        throw Exception('Failed to fetch userLikes');
      }
    } catch (error) {
      throw Exception('Failed to fetch userLikes: $error');
    }
  }

  static Future<Map<String, dynamic>?> getUserLike(String id) async {
    try {
      final response = await _dio.get(url + userLike.replaceAll(':id', id));

      if (response.statusCode == 200) {
        final userLikeDataJson = response.data as Map<String, dynamic>;
        final userLike = userLikeDataJson;
        return userLike;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> createUserLike(
      Map<String, dynamic> userLikeData) async {
    try {
      final response = await _dio.post(url + sendUserLike, data: userLikeData);

      if (response.statusCode == 200) {
        final userLikeDataJson = response.data as Map<String, dynamic>;
        final userLike = userLikeDataJson;
        return userLike;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> updateUserLike(
      String id, Map<String, dynamic> userLikeData) async {
    try {
      final response = await _dio.put(
        url + putUserLike.replaceAll(':id', id),
        data: userLikeData,
      );

      if (response.statusCode == 200) {
        final userLikeDataJson = response.data as Map<String, dynamic>;
        final userLike = userLikeDataJson;
        return userLike;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> deleteUserLike(String id) async {
    try {
      final response =
      await _dio.delete(url + delUserLike.replaceAll(':id', id));

      if (response.statusCode == 200) {
        final userLikeDataJson = response.data as Map<String, dynamic>;
        final userLike = userLikeDataJson;
        return userLike;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> patchUserLike(
      String id, Map<String, dynamic> userLikeData) async {
    try {
      final response = await _dio.patch(
        url + userLike.replaceAll(':id', id),
        data: userLikeData,
      );

      if (response.statusCode == 200) {
        final userLikeDataJson = response.data as Map<String, dynamic>;
        final userLike = userLikeDataJson;
        return userLike;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}