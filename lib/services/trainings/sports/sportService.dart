import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/constants/auth.dart';

class SportService {
  static final url = Api.NESTJS_BASE_URL;
  static final allSport = "sports";
  static final sport = "sports/:id";
  static final sendSport = "sports/:id";
  static final putSport = "sports/:id";
  static final delSport = "sports/:id";

  static final Dio _dio = Dio();
  static final storage = FlutterSecureStorage(); // Ajouté

  static Future<String?> getToken() async {
    return await storage.read(key: 'authToken'); // Ajouté
  }

  static Future<List<dynamic>> getAllTraining() async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.get(
        url + allSport,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> sportDataList = response.data as List<dynamic>;
        final List<dynamic> sports = sportDataList.map((data) {
          return data;
        }).toList();
        return sports;
      } else {
        throw Exception('Failed to fetch sports');
      }
    } catch (error) {
      throw Exception('Failed to fetch sports: $error');
    }
  }

  static Future<dynamic> getSport(String id) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.get(
        url + sport.replaceAll(':id', id),
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final sportDataJson = response.data as Map<String, dynamic>;
        final sport = sportDataJson;
        return sport;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> createSport(Map<String, dynamic> sportData) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.post(
        url + sendSport,
        data: sportData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final sportDataJson = response.data as Map<String, dynamic>;
        final sport = sportDataJson;
        return sport;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> updateSport(
      String id, Map<String, dynamic> sportData) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.put(
        url + putSport.replaceAll(':id', id),
        data: sportData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final sportDataJson = response.data as Map<String, dynamic>;
        final sport = sportDataJson;
        return sport;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> deleteSport(String id) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.delete(
        url + delSport.replaceAll(':id', id),
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final sportDataJson = response.data as Map<String, dynamic>;
        final sport = sportDataJson;
        return sport;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
