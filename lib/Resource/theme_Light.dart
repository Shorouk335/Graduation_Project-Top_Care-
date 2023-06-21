import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';

//TextStyle Function
TextStyle txtStyle(Color? color, var doublesize, bool weight) {
  return TextStyle(
    color: color!,
    fontSize: doublesize,
    fontWeight: (weight) ? FontWeight.bold : null,
    decoration: TextDecoration.none,
  );
}

enum AppTheme {
  blueLight("Light"),
  blueDark(" Dark");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.blueLight: (BuildContext context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: ColorManager.BlueBasiColor,
      ),
  AppTheme.blueDark: (BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorManager.DarkColorOnly,
        primaryColor: ColorManager.BlueBasiColor,
      ),
};
