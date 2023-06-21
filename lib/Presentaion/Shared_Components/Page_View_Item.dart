import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/PageViewModel.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

// for Make pageView on the OnBording Screen
Widget PageViewItem({
  // class of PageViewModel with data of one item
  required PageViewModel? model,
  required BuildContext context,
}) {
  // Text + disc + Img
  return Column(
    children: [
      SizedBox(
        height: 50,
      ),
      Text("${model?.title}",
          style: txtStyle(ColorManager.DarkBasiColor(context), 30.0, true)),
      SizedBox(
        height: 20,
      ),
      Text("${model?.disc}",
          style: txtStyle(ColorManager.DGrayBasiColor, 15.0, false),
          maxLines: 2),
      Center(
          child: Image(
        width: MediaQuery.of(context).size.width,
        image: AssetImage("${model?.img}"),
        height: MediaQuery.of(context).size.height / model?.Hsize,
        //   fit: BoxFit.contain,
      )),
    ],
  );
}
