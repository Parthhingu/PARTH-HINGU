import 'dart:developer';

import 'package:cartgreek/api/current_booking_api/current_booking_api.dart';
import 'package:cartgreek/api/pakages_api/pakages_api.dart';
import 'package:cartgreek/model/current_booking/current_booking_data.dart';
import 'package:cartgreek/model/pakages/pakages_data.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  CurrentBookingData currentBookingData = CurrentBookingData.initial();
  List<PakagesData> pakagesDataList = [];
  bool isFecthing = false;

  void onRefresh() async {
    currentBookingData = CurrentBookingData.initial();
    pakagesDataList = [];
    isFecthing = false;
    await loadNewList();
  }

  Future<void> loadNewList() async {
    try {
      isFecthing = true;
      final list = await Future.wait([
        CurrentBookingApiProvider.getCurrentBookingData(),
        PakagesApiProvider.getPakagesData(),
      ]);
      if (list[0] is CurrentBookingData) {
        currentBookingData = list[0] as CurrentBookingData;
      }
      if (list[1] is List<PakagesData>) {
        pakagesDataList = [];
        pakagesDataList.addAll(list[1] as List<PakagesData>);
      }
      isFecthing = false;
      _stateChange();
    } catch (e) {
      log(e.toString());
    }
  }

  void _stateChange() {
    update();
  }
}
