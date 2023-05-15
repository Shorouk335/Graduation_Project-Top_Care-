import 'package:flutter/material.dart';
class ColorManager{

 static const Color BlueBasiColor =  Color(0xFF9BD7EA);

 static Color DarkBasiColor(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  return brightness == Brightness.light
      ? const Color(0xFF202D39)
      : Color(0xFFF5FBFF) ;
 }
 static Color WitheToDarkColor(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  return brightness == Brightness.light
      ? const Color(0xffffffff)
      : const Color(0xFF202D39);
 }
 static Color DarkColorOnly =  Color(0xFF202D39);
 static const Color LGrayBasiColor =  Color(0xFFF5F7F9);
 static const Color DGrayBasiColor =  Color(0xFFBFBEBE);
 static const Color LBlueBasiColor =  Color(0xFFF5FBFF);



}


