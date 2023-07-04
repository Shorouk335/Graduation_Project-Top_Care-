import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

// photo of result
Widget PhotoCard(String asset, String text,String? num , BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Card(
      shadowColor: ColorManager.DarkBasiColor(context),
      color: ColorManager.WitheToDarkColor(context),
      elevation: 50,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(asset ,width: 250, height:250),
            SizedBox(
              height: 10,
            ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: text,
                  style: txtStyle(ColorManager.DarkBasiColor(context), 20.0, true)),
              TextSpan(
                  text: '$num%',
                  style: txtStyle(Colors.red,20.0,true)),
            ],
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
          ],
        ),
      ),
    ),
  );
}

// // %
// Widget textnumOfDetect(String num) {
//   return Text(num, style: txtStyle(Colors.red, 35.0, true));
// }

//recommenditon
Widget textofRecommenditon(String txt, BuildContext context) {
  return Text(
    txt,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: ColorManager.DarkBasiColor(context),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

// Share to Dr
void showShareDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorManager.WitheToDarkColor(context),
        title: Text(
          'Share to',
          style: txtStyle(ColorManager.DarkBasiColor(context), 15.0, true),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildShareRow(
                  'Dr: Ali', Icons.send, 'assets/images/drphoto.png', context),
              buildShareRow(
                  'Dr: John', Icons.send, 'assets/images/drphoto.png', context),
              buildShareRow(
                  'Dr: Lisa', Icons.send, 'assets/images/drphoto.png', context),
            ],
          ),
        ),
      );
    },
  );
}

//Dialog to share with dr
Widget buildShareRow(
    String name, IconData icon, String image, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: TextStyle(
            color: ColorManager.DarkBasiColor(context),
          ),
        ),
        const Spacer(),
        IconButton(
          color: ColorManager.DarkBasiColor(context),
          icon: Icon(icon),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.Patient_QuestionScreen);
          },
        ),
      ],
    ),
  );
}
