import 'dart:convert';
import 'dart:developer';

import 'package:cartgreek/api/api_controller.dart';
import 'package:cartgreek/model/current_booking/current_booking_data.dart';
import 'package:dio/dio.dart';

class CurrentBookingApiProvider {
  static Future<CurrentBookingData?> getCurrentBookingData() async {
    CurrentBookingData? currentBookingData;
    Response response =
        await (await ApiController.dio()).get('flutter/').catchError((e) {
      log(e.toString());
    });
    if (response.statusCode == 200) {
      if (response.data != null) {
        final decodeData = json.decode(response.data);
        final data =
            CurrentBookingData.fromJson(decodeData['current_bookings']);
        if (data.packageLabel != null) {
          currentBookingData = data;
        }
      }
    } else if (response.statusCode == 401) {
      log('Authentication Error ${response.statusCode}');
    } else if (response.statusCode == 400) {
      log('Authentication Error ${response.statusCode}');
    }
    return currentBookingData;
  }
}
