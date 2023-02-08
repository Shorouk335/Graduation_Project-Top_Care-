import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';

 // to show dialog on the center of screen

//with img & txt using in the log in and sign up
Future<dynamic> ShowDialog(context, {String? img, String? txt, String? type}) {
  return AwesomeDialog(
    context: context,
    // to defint the type of top icon in dialog
    dialogType: (type! == "error")
        ? DialogType.ERROR
        : ((type == "suc") ? DialogType.SUCCES : DialogType.WARNING),
    dialogBorderRadius: BorderRadius.circular(20.0),
    autoHide: Duration(seconds: 3),
    // the content of dialog
    body: (type == "suc")
        ? SizedBox()
        : Column(
            children: [
              Image.asset(img!, width: 250),
              Text(
                "$txt",
                style: txtStyle(ColorManager.CyneColordark, 20.0, false),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
  ).show();
}



// with img & create account botton & login bottton using if user does't login
Future<dynamic> DialogToLogin(context, {String? img}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    dialogBorderRadius: BorderRadius.circular(20.0),
    // the content of dialog
    body: Column(
      children: [
        //Img
        Image.asset(img!, width: 250),
        //Create account
        Container(
          width: 250,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.BlueBasiColor),
          child: Center(
              child: Text(
            "Create An Account",
            style: txtStyle(Colors.white, 20.0, true),
          )),
        ),
        SizedBox(
          height: 10,
        ),
        //log in
        Container(
          width: 250,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.BlueBasiColor),
          child: Center(
              child: Text(
            "Log In",
            style: txtStyle(Colors.white, 20.0, true),
          )),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    ),
  ).show();
}
