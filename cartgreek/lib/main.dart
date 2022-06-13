import 'package:cartgreek/core/controller/data_controller.dart';
import 'package:cartgreek/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataController>(DataController());
  }
}
