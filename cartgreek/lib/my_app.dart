import 'dart:io';

import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/main.dart';
import 'package:cartgreek/main_home_page.dart';
import 'package:cartgreek/routes/routes.dart';
import 'package:cartgreek/splash/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FoodZone',
      routes: _buildRoute(),
      theme: AppTheme.getThemeData,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        _setStatusBarNavigationBarTheme(AppTheme.getThemeData);
        return Builder(
          builder: (BuildContext context) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: MediaQuery.of(context).size.width > 360
                    ? 1.0
                    : MediaQuery.of(context).size.width >= 340
                        ? 0.9
                        : 0.8,
              ),
              child: child ?? const SizedBox(),
            );
          },
        );
      },
    );
  }

  Map<String, WidgetBuilder> _buildRoute() {
    return {
      RoutesName.Splash: (context) => const SplashPage(),
      RoutesName.Home: (context) => const MainHomePage(),
    };
  }

  void _setStatusBarNavigationBarTheme(ThemeData themeData) {
    final brightness = !kIsWeb && Platform.isAndroid
        ? themeData.brightness == Brightness.light
            ? Brightness.light
            : Brightness.dark
        : themeData.brightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.primaryTextColor,
      statusBarIconBrightness: brightness,
      statusBarBrightness: brightness,
      systemNavigationBarColor: AppTheme.primaryTextColor,
      systemNavigationBarDividerColor: AppTheme.primaryTextColor,
      systemNavigationBarIconBrightness: brightness,
    ));
  }
}
