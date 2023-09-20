import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/constants/auth.dart';
import 'package:renconsport/models/training/training_details.dart';

class TrainingService {
  static final url = Api.NESTJS_BASE_URL;
  static final allTraining = "trainings";
  static final training = "trainings/:id";
  static final sendTraining = "trainings/:id";
  static final putTraining = "trainings/:id";
  static final delTraining = "trainings/:id";

  static final Dio _dio = Dio();
  static final storage = FlutterSecureStorage();

  static Future<String?> getToken() async {
    return await storage.read(key: 'authToken');
  }

  static Future<List<TrainingDetail>> getAllTraining() async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.get(
        url + allTraining,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        print("Data: ${response.data}");

        final List<dynamic> trainingDataList = response.data as List<dynamic>;
        final List<TrainingDetail> trainings = trainingDataList.map((data) {
          return TrainingDetail.fromJson(data);
        }).toList();
        return trainings;
      } else {
        throw Exception('Failed to fetch trainings');
      }
    } catch (error) {
      throw Exception('Failed to fetch trainings: $error');
    }
  }

  static Future<dynamic> getTraining(String id) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.get(
        url + training.replaceAll(':id', id),
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final trainingDataJson = response.data as Map<String, dynamic>;
        final training = trainingDataJson;
        return training;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> createTraining(
      Map<String, dynamic> trainingData) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.post(
        url + sendTraining,
        data: trainingData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final trainingDataJson = response.data as Map<String, dynamic>;
        final training = trainingDataJson;
        return training;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> deleteTraining(String id) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.delete(
        url + delTraining.replaceAll(':id', id),
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final trainingDataJson = response.data as Map<String, dynamic>;
        final training = trainingDataJson;
        return training;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> updateTraining(
      String id, Map<String, dynamic> trainingData) async {
    try {
      String? token = await getToken(); // Ajouté

      final response = await _dio.put(
        url + putTraining.replaceAll(':id', id),
        data: trainingData,
        options: Options(
          headers: {"Authorization": "Bearer $token"}, // Ajouté
        ),
      );

      if (response.statusCode == 200) {
        final trainingDataJson = response.data as Map<String, dynamic>;
        final training = trainingDataJson;
        return training;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
