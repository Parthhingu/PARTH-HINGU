import 'dart:convert';
import 'dart:developer';
import 'package:cartgreek/api/api_controller.dart';
import 'package:cartgreek/model/pakages/pakages_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PakagesApiProvider {
  static Future<List<PakagesData>> getPakagesData() async {
    List<PakagesData> pakagesData = [];
    Response response =
        await (await ApiController.dio()).get('flutter/').catchError((e) {
      log(e.toString());
    });
    if (response.statusCode == 200) {
      if (response.data != null) {
        final decodeData = json.decode(response.data);
        for (var element in decodeData['packages']) {
          if (element != null) {
            final data = PakagesData.fromJson(element);
            pakagesData.add(data);
            if (kDebugMode) print('length ${pakagesData.length}');
          }
        }
      }
    } else if (response.statusCode == 401) {
      log('Authentication Error ${response.statusCode}');
    } else if (response.statusCode == 400) {
      log('Authentication Error ${response.statusCode}');
    }
    return pakagesData;
  }
}
