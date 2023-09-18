import 'package:dio/dio.dart';
import 'package:renconsport/constants/auth.dart';

class ExerciceService {
  static const url = Api.NESTJS_BASE_URL;
  static const allExercice = "exercices";
  static const exercice = "exercices/:id";
  static const sendExercice = "exercices/:id";
  static const putExercice = "exercices/:id";
  static const patchExercices = "exercices/:id";
  static const delExercice = "exercices/:id";

  static final Dio _dio = Dio();

  static Future<List<dynamic>> getAllExercice() async {
    try {
      final response = await _dio.get(url + allExercice);

      if (response.statusCode == 200) {
        final List<dynamic> exerciceDataList = response.data as List<dynamic>;
        final List<dynamic> exercices = exerciceDataList.map((data) {
          return data;
        }).toList();
        return exercices;
      } else {
        throw Exception('Failed to fetch exercices');
      }
    } catch (error) {
      throw Exception('Failed to fetch exercices: $error');
    }
  }

  static Future<dynamic> getExercice(String id) async {
    try {
      final response = await _dio.get(url + exercice.replaceAll(':id', id));

      if (response.statusCode == 200) {
        final exerciceDataJson = response.data as Map<String, dynamic>;
        final exercice = exerciceDataJson;
        return exercice;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> createExercice(
      Map<String, dynamic> exerciceData) async {
    try {
      final response = await _dio.post(url + sendExercice, data: exerciceData);

      if (response.statusCode == 200) {
        final exerciceDataJson = response.data as Map<String, dynamic>;
        final exercice = exerciceDataJson;
        return exercice;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> deleteExercice(String id) async {
    try {
      final response =
          await _dio.delete(url + delExercice.replaceAll(':id', id));

      if (response.statusCode == 200) {
        final exerciceDataJson = response.data as Map<String, dynamic>;
        final exercice = exerciceDataJson;
        return exercice;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> updateExercice(
      String id, Map<String, dynamic> exerciceData) async {
    try {
      final response = await _dio.put(
        url + putExercice.replaceAll(':id', id),
        data: exerciceData,
      );

      if (response.statusCode == 200) {
        final exerciceDataJson = response.data as Map<String, dynamic>;
        final exercice = exerciceDataJson;
        return exercice;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> patchExercice(
      String id, Map<String, dynamic> exerciceData) async {
    try {
      final response = await _dio.patch(
        url + patchExercices.replaceAll(':id', id),
        data: exerciceData,
      );

      if (response.statusCode == 200) {
        final exerciceDataJson = response.data as Map<String, dynamic>;
        final exercice = exerciceDataJson;
        return exercice;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
