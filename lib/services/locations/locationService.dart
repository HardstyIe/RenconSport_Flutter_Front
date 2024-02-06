import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/constants/auth.dart';

class LocationService {
  static const url = Api.NESTJS_BASE_URL;
  static const allLocation = "locations";
  static const location = "locations/:id";
  static const sendLocation = "locations/:id";
  static const putLocation = "locations/:id";
  static const delLocation = "locations/:id";

  static final Dio _dio = Dio();
  static final storage = FlutterSecureStorage(); // Ajouté

  static Future<String?> getToken() async {
    return await storage.read(key: 'authToken'); // Ajouté
  }

  static Future<List<dynamic>> getAllLocation() async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.get(
        url + allLocation,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> locationDataList = response.data as List<dynamic>;
        final List<dynamic> locations = locationDataList.map((data) {
          return data;
        }).toList();
        return locations;
      } else {
        throw Exception('Failed to fetch locations');
      }
    } catch (error) {
      throw Exception('Failed to fetch locations: $error');
    }
  }

  static Future<Map<String, dynamic>?> getLocation(String id) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.get(
        url + location.replaceAll(':id', id),
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final locationDataJson = response.data as Map<String, dynamic>;
        final location = locationDataJson;
        return location;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> createLocation(
      Map<String, dynamic> locationData) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.post(
        url + sendLocation,
        data: locationData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final locationDataJson = response.data as Map<String, dynamic>;
        final location = locationDataJson;
        return location;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> updateLocation(
      String id, Map<String, dynamic> locationData) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.put(
        url + putLocation.replaceAll(':id', id),
        data: locationData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final locationDataJson = response.data as Map<String, dynamic>;
        final location = locationDataJson;
        return location;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> deleteLocation(
      String id, Map<String, dynamic> locationData) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.delete(
        url + delLocation.replaceAll(':id', id),
        data: locationData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final locationDataJson = response.data as Map<String, dynamic>;
        final location = locationDataJson;
        return location;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
