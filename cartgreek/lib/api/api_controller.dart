import 'package:dio/dio.dart';

class ApiController {
  static Future<Dio> dio() async {
    final dioData = Dio(
      BaseOptions(
        baseUrl: 'http://cgprojects.in/',
        contentType: 'application/json',
      ),
    );
    return dioData;
  }
}
