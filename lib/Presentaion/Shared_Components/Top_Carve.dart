import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
Widget TopCarve ({BuildContext? context, bool? Havetitle ,String? title ,Widget? content } ){
  return  Stack(
      children:<Widget>[
        Container(
          height: 180,
        ),
        Container(
          height: 150,
          decoration: new BoxDecoration(
              color: ColorManager.BlueBasiColor,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(MediaQuery.of(context!).size.width,60.0)
              )
          ),
          child:(Havetitle!) ?Center(
              child : Text("${title}",
                style: txtStyle(ColorManager.WitheToDarkColor(context), 30.0, true),
              )
          ) : content

        ),

      ]

  );


}