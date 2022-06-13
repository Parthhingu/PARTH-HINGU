import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static bool get isLightMode {
    return true;
  }

  // colors
  static Color get primaryColor =>
      isLightMode ? const Color(0xFFE36DA6) : const Color(0xFFE36DA6);

  static Color get secondaryColor =>
      isLightMode ? const Color(0xFF262F71) : const Color(0xFF262F71);

  static Color get scaffoldBackgroundColor =>
      isLightMode ? const Color(0xFFFFFFFF) : const Color(0xFF1A1A1A);

  static Color get backgroundColor =>
      isLightMode ? const Color(0xFFFFFFFF) : const Color(0xFF2C2C2C);

  static Color get primaryTextColor =>
      isLightMode ? const Color(0xFF262626) : const Color(0xFFFFFFFF);

  static Color get secondaryTextColor =>
      isLightMode ? const Color(0xFFADADAD) : const Color(0xFF6D6D6D);

  static Color get whiteColor => const Color(0xFFFFFFFF);
  static Color get balckColor => const Color(0xFF262626);

  static Color get fontcolor =>
      isLightMode ? const Color(0xFF1A1A1A) : const Color(0xFFF7F7F7);

  static ThemeData get getThemeData =>
      isLightMode ? _buildLightTheme() : _buildDarkTheme();

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: getTextStyle(base.headline1!), //f-size 96
      headline2: getTextStyle(base.headline2!), //f-size 60
      headline3: getTextStyle(base.headline3!), //f-size 48
      headline4: getTextStyle(base.headline4!), //f-size 34
      headline5: getTextStyle(base.headline5!), //f-size 24
      headline6: getTextStyle(
        base.headline6!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 20
      button: getTextStyle(base.button!), //f-size 14
      caption: getTextStyle(base.caption!), //f-size 12
      bodyText1: getTextStyle(base.bodyText1!), //f-size 16
      bodyText2: getTextStyle(base.bodyText2!), //f-size 14
      subtitle1: getTextStyle(
        base.subtitle1!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 16
      subtitle2: getTextStyle(base.subtitle2!), //f-size 14
      overline: getTextStyle(base.overline!), //f-size 10
    );
  }

// we also get some Light and Dark color variants

  static TextStyle getTextStyle(TextStyle textStyle) {
    return GoogleFonts.workSans(textStyle: textStyle);
  }

  static ThemeData _buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: backgroundColor,
      canvasColor: backgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData _buildDarkTheme() {
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: backgroundColor,
      canvasColor: scaffoldBackgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
      color: backgroundColor,
      shadowColor: secondaryTextColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8,
      margin: const EdgeInsets.all(0),
    );
  }
}
