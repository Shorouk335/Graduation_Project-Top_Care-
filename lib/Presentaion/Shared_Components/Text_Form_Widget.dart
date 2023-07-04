import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

// TextFormField item
Widget LargeTextFormWidget(
    {String? txt,
    IconData? icon,
    bool? password,
    TextEditingController? controller,
    void Function()? ontap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      style: txtStyle(Colors.black, 15.0, false),
      // لاخفاء واظهار النص
      obscureText: password!,
      cursorColor: ColorManager.DGrayBasiColor,
      // عشان اتاكد ان المستخدم دخل البيانات قبل الانتقال للصفحه التاليه
      validator: (value) {
        if (value!.isEmpty)
          return "$txt can't be empty";
        else
          return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.LGrayBasiColor,
        //استايل الكلام الخفي
        hintText: "$txt",
        hintStyle: txtStyle(ColorManager.DGrayBasiColor, 15.0, false),
        // الايكون الي في الاخر
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (password)
              // ايكون العين عشان لو ضغط يظهر الكلام
              ? InkWell(
                  onTap: ontap,
                  child: Icon(
                    icon,
                    size: 30,
                    color: ColorManager.DGrayBasiColor,
                  ),
                )
              : Icon(
                  icon,
                  size: 30,
                  color: ColorManager.DGrayBasiColor,
                ),
        ),
//حاله الفورم لو ضغط عليها
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.LGrayBasiColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
// حاله الفورم لو مضغطش
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.LGrayBasiColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}

// TextFormField item
Widget SmallTextFormWidget({
  BuildContext? context,
  String? txt,
  TextEditingController? controller,
  void Function()? ontap1,
  void Function()? ontap2,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context!).size.width *0.7,
      height: 60,
      child: TextFormField(
        controller: controller,
        style: txtStyle(ColorManager.DarkBasiColor(context), 12.0, false),
        cursorColor: ColorManager.DGrayBasiColor,
        decoration: InputDecoration(
          filled: true,
          fillColor:  ColorManager.LGrayBasiColor.withOpacity(0.9),
          //استايل الكلام الخفي
          hintText: "$txt",
          hintStyle: txtStyle(ColorManager.DGrayBasiColor, 12.0, false),
          // الايكون الي في الاخر
          prefixIcon: IconButton(
            onPressed: ontap1,
            icon: Icon(
              Icons.search,
              size: 20,
              color: ColorManager.DGrayBasiColor,
            ),
          ),
          suffix: (controller!.text.isEmpty)
              ? SizedBox()
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: ontap2,
              icon: Icon(
                Icons.clear,
                size: 15.0,
                color: ColorManager.DGrayBasiColor,
              ),
            ),
          ),
//حاله الفورم لو ضغط عليها
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.LGrayBasiColor.withOpacity(0.9),
                width: 0
            ),
            borderRadius: BorderRadius.circular(30),
          ),
// حاله الفورم لو مضغطش
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0,
                color: ColorManager.LGrayBasiColor.withOpacity(0.9)
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}

Widget TextFormWithoutIcon({
  TextEditingController? controller,
}) {
  return TextFormField(
    style: txtStyle(Colors.black, 15.0, false),
    cursorColor: ColorManager.DGrayBasiColor,
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: ColorManager.LGrayBasiColor,
      //حاله الفورم لو ضغط عليها
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.LGrayBasiColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
// حاله الفورم لو مضغطش
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.LGrayBasiColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
