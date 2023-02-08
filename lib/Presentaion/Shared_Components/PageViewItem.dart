import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/PageViewModel.dart';

// for Make pageView on the OnBording Screen
Widget PageViewItem({
  // class of PageViewModel with data of one item
  required PageViewModel? model,
  required BuildContext context,
}) {
   // Text + disc + Img
  return Column(
        children: [
          SizedBox(height: 50,),
          Text("${model?.title}",
              style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 20,),
          Text("${model?.disc}",
              style: Theme.of(context).textTheme.bodyText2, maxLines: 2),
          Center(
              child: Image(
                width: MediaQuery.of(context).size.width,
                image: AssetImage(
                    "${model?.img}"),
                height: MediaQuery.of(context).size.height/model?.Hsize,
                //   fit: BoxFit.contain,
              )),

        ],
      ) ;
}
