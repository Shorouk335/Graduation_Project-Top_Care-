import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

 // to show dialog on the center of screen

//with img & txt using in the log in and sign up
Future<dynamic> ShowDialogSign(context, {String? img, String? txt, String? type}) {
  return AwesomeDialog( 
    dialogBackgroundColor: ColorManager.WitheToDarkColor(context),
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
                style: txtStyle(ColorManager.BlueBasiColor, 20.0, false),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
  ).show();
}



// with img & create account botton & login bottton using if user does't login in home
Future<dynamic> ShowDialogToLogInApp(context, {String? img}) {
  return AwesomeDialog(
    dialogBackgroundColor: ColorManager.WitheToDarkColor(context),
    context: context,
    dialogType: DialogType.noHeader,
    dialogBorderRadius: BorderRadius.circular(20.0),
    // the content of dialog
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Img
        Image.asset(img!, width: 250),
        //Create account
        InkWell(
          onTap: (){
            Navigator.pushReplacementNamed(
                context, RouteGenerator.Common_SignUpRoute);
          },
          child: Container(
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
        ),
        SizedBox(
          height: 10,
        ),
        //log in
        InkWell(
          onTap: (){
            Navigator.pushReplacementNamed(
                context, RouteGenerator.LoginRoute);
          },
          child: Container(
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
        ),
        SizedBox(
          height: 50,
        ),
      ],
    ),
  ).show();
}


// show in Setting
AwesomeDialog ShowDialogInfoSetting(context) {
  return AwesomeDialog(
    dialogBackgroundColor: ColorManager.WitheToDarkColor(context),
    context: context,
    animType: AnimType.scale,
    customHeader: const Icon(
      Icons.info_outline_rounded,
      size: 50,
      color: ColorManager.BlueBasiColor,
    ),
    body: ShowDialogSetting(
      "Medical app For major Pneumonia Detection  using Chest X-Ray " ,context,
    ),
    btnOkText: "Okay",
    btnOkColor:ColorManager.BlueBasiColor,
    btnOkOnPress: () {},
  )..show();
}
AwesomeDialog ShowDialogConectSetting(context) {
  return AwesomeDialog(
    dialogBackgroundColor: ColorManager.WitheToDarkColor(context),
    context: context,
    animType: AnimType.scale,
    customHeader: const Icon(
      Icons.connect_without_contact_rounded,
      color: ColorManager.BlueBasiColor,
      size: 50,
    ),
    body: ShowDialogSetting("phone :\n0104500267\nGmail :\nTopcare@gmail.com ", context),
    btnOkText: "Okay",
    btnOkColor: ColorManager.BlueBasiColor,
    btnOkOnPress: () {},
  )..show();
}
Widget ShowDialogSetting(String? text , BuildContext context) {
  return Container(
      height: 100,
      width: 200,
      decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorManager.DGrayBasiColor,
              width: 1.0,
            ),
          )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$text",
              style: txtStyle(ColorManager.DarkBasiColor(context), 15.0, true),
            ),
          ],
        ),
      ));
}

