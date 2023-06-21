import 'package:flutter/material.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Circular_Img.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

Widget Public_Patient_Notification({
  BuildContext? context,
  String? name,
  String? img,
  String? Time,
  String? IconTxt,
}) {
  return Container(
    width: MediaQuery.of(context!).size.width * 0.8,
    height: MediaQuery.of(context).size.height * 0.12,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: ColorManager.LGrayBasiColor.withOpacity(0.9),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          InkWell(
            // open dr profile FB
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.DoctorProfile);
            },
            child: CircularImg(img: img, height: 50, width: 50),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: txtStyle(ColorManager.DarkColorOnly, 20.0, true),
              ),
              Text(
                Time!,
                style: txtStyle(ColorManager.DGrayBasiColor, 15.0, false),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              (IconTxt!.contains("Reject"))
                  ? Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 50,
                    )
                  : Icon(
                      Icons.check_circle_outline,
                      color: ColorManager.DarkColorOnly,
                      size: 50,
                    ),
              Text(
                IconTxt,
                style: (IconTxt.contains("Reject"))
                    ? txtStyle(Colors.red, 15.0, true)
                    : txtStyle(ColorManager.DarkColorOnly, 15.0, false),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget View_Result_Patient_Notification({
  BuildContext? context,
  String? name,
  String? img,
  String? Time,
  String? IconTxt,
}) {
  return Container(
    width: MediaQuery.of(context!).size.width * 0.8,
    height: MediaQuery.of(context).size.height * 0.12,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: ColorManager.LGrayBasiColor.withOpacity(0.9),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          InkWell(
            // open dialog of dr comment
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.DoctorProfile);
            },
            child: CircularImg(img: img, height: 50, width: 50),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: txtStyle(ColorManager.DarkColorOnly, 20.0, true),
              ),
              Text(
                Time!,
                style: txtStyle(ColorManager.DGrayBasiColor, 15.0, false),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              // doctor result
            },
            child: Column(
              children: [
                Icon(
                  Icons.check_circle,
                  color: ColorManager.BlueBasiColor,
                  size: 50,
                ),
                Text(
                  IconTxt!,
                  style: txtStyle(ColorManager.BlueBasiColor, 15.0, false),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget View_Scan_Doctor_Notification({
  BuildContext? context,
  String? name,
  String? img,
  String? Time,
  String? IconTxt,
}) {
  return Container(
    width: MediaQuery.of(context!).size.width * 0.8,
    height: MediaQuery.of(context).size.height * 0.12,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: ColorManager.LGrayBasiColor.withOpacity(0.9),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          InkWell(
            // open dr profile FB
            onTap: () {
              // Navigator.pushReplacementNamed(context, RouteGenerator.PetProfile);
            },
            child: CircularImg(img: img, height: 50, width: 50),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: txtStyle(ColorManager.DarkColorOnly, 20.0, true),
              ),
              Text(
                Time!,
                style: txtStyle(ColorManager.DGrayBasiColor, 15.0, false),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              //view patient scan img & txt & make comment
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.Settingscreen);
            },
            child: Column(
              children: [
                Icon(
                  Icons.check_circle,
                  color: ColorManager.BlueBasiColor,
                  size: 50,
                ),
                Text(
                  IconTxt!,
                  style: txtStyle(ColorManager.BlueBasiColor, 15.0, false),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
