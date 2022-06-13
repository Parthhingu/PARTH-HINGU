import 'package:cartgreek/main_home_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NavigationServices {
  NavigationServices();

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog: false}) async {
    return await Get.to(widget, fullscreenDialog: fullscreenDialog);
  }

  Future<dynamic> gotoHomeScreen() async {
    return await _pushMaterialPageRoute(const MainHomePage());
  }
}
