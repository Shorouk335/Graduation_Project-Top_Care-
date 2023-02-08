import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';

 ThemeData LightApp= ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
   bodyText1: txtStyle(Colors.black, 30.0, true),
   bodyText2: txtStyle(ColorManager.GrayColorLight, 15.0, false),
  ),

);

TextStyle txtStyle (Color color ,var doublesize , bool weight){
 return TextStyle(
  color: color ,
  fontSize: doublesize ,
  fontWeight: (weight)? FontWeight.bold : null ,
  decoration: TextDecoration.none,

 );
}