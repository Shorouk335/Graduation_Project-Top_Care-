import 'package:flutter/material.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Awesom_Dialog.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';

// for curver navigator Bar in the bottom of applicaton
Widget CurvedBottomNav(context) {

  return Padding(
    padding: const EdgeInsets.only(right: 15.0,left: 15.0,bottom: 15.0),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        // container with 2 continer in it to make icon scan in the best position
        Container(
            height: 100.00,
            color: ColorManager.WitheToDarkColor(context),
            child: Column(
              children: [
                // continer empty
                Container(
                  height: 45,
                ),
                // continer with icon home and person
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: ColorManager.DarkBasiColor(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () async{
                          },
                          icon: Icon(
                            Icons.home,
                            color:ColorManager.WitheToDarkColor(context),
                            size: 35.00,
                          )),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            ShowDialogToLogInApp(
                                context,
                                img: AssetManager.AwesomError);
                          },
                          icon: Icon(
                            Icons.account_circle,
                            color: ColorManager.WitheToDarkColor(context),
                            size: 35.00,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ],
            )),
        // Icon Scan
        CircleAvatar(
            backgroundColor: ColorManager.WitheToDarkColor(context),
            radius: 40.0,
            child: InkWell(
                onTap: () {
                  ShowDialogToLogInApp(context, img: AssetManager.AwesomError);
                },
                child: Icon(
                  Icons.filter_center_focus,
                  color: ColorManager.DarkBasiColor(context),
                  size: 65.0,
                ))),
      ],
    ),
  );
}
