import 'package:dio/dio.dart';
import 'package:renconsport/constants/auth.dart';

class RoundService {
  static const url = Api.NESTJS_BASE_URL;
  static const allRound = "rounds";
  static const round = "rounds/:id";
  static const sendRound = "rounds/:id";
  static const putRound = "rounds/:id";
  static const patchRounds = "rounds/:id";
  static const delRound = "rounds/:id";

  static final Dio _dio = Dio();

  static Future<List<dynamic>> getAllRound() async {
    try {
      final response = await _dio.get(url + allRound);

      if (response.statusCode == 200) {
        final List<dynamic> roundDataList = response.data as List<dynamic>;
        final List<dynamic> rounds = roundDataList.map((data) {
          return data;
        }).toList();
        return rounds;
      } else {
        throw Exception('Failed to fetch rounds');
      }
    } catch (error) {
      throw Exception('Failed to fetch rounds: $error');
    }
  }

  static Future<dynamic> getRound(String id) async {
    try {
      final response = await _dio.get(url + round.replaceAll(':id', id));

      if (response.statusCode == 200) {
        final roundDataJson = response.data as Map<String, dynamic>;
        final round = roundDataJson;
        return round;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> createRound(Map<String, dynamic> roundData) async {
    try {
      final response = await _dio.post(url + sendRound, data: roundData);

      if (response.statusCode == 200) {
        final roundDataJson = response.data as Map<String, dynamic>;
        final round = roundDataJson;
        return round;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> updateRound(
      String id, Map<String, dynamic> roundData) async {
    try {
      final response =
          await _dio.put(url + putRound.replaceAll(':id', id), data: roundData);

      if (response.statusCode == 200) {
        final roundDataJson = response.data as Map<String, dynamic>;
        final round = roundDataJson;
        return round;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> patchRound(
      String id, Map<String, dynamic> roundData) async {
    try {
      final response = await _dio.patch(url + patchRounds.replaceAll(':id', id),
          data: roundData);

      if (response.statusCode == 200) {
        final roundDataJson = response.data as Map<String, dynamic>;
        final round = roundDataJson;
        return round;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> deleteRound(String id) async {
    try {
      final response = await _dio.delete(url + delRound.replaceAll(':id', id));

      if (response.statusCode == 200) {
        final roundDataJson = response.data as Map<String, dynamic>;
        final round = roundDataJson;
        return round;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
