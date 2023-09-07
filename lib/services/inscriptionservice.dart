import 'package:dio/dio.dart';
import 'package:renconsport/widgets/homepage/homepage.dart';

class InscriptionService {
  static const url = "http://localhost:3000/auth/register";
  static final Dio  _dio = Dio();

  static Future<HomePage> getRegister() async {

  }
}