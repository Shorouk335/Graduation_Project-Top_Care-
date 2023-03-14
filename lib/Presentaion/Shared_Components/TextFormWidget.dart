import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';

import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';

// غلط عند ايكون الباسورد لا تتغير مره اخري
// TextFormField item
Widget TextFormWidget(
    {
    String? txt,
    IconData? icon,
    bool? password,
    TextEditingController? controller,
    void Function()? ontap
    }) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
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
                  size:30,
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



