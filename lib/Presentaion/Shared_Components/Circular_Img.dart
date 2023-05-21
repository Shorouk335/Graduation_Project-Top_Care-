import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CircularImg ({String? img , double? height , double? width}){
  return ClipOval(
    child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: AssetImage('${img}'),
        fit: BoxFit.cover,
        height: height,
        width: width,
        child: InkWell(
          //  onTap: onClicked,
        ),
      ),
    ),
  );
}