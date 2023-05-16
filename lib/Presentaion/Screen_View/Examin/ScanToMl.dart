import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/Cubit/Scan_Xray_Cubit.dart';
import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'dart:io';

import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

//page 2 of scan x ray
class ScanToMl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Scan_Xray_Cubit(),
      child: BlocConsumer<Scan_Xray_Cubit, Scan_Xray_States>(
        listener: (context, states) {},
        builder: (context, states) {
          Scan_Xray_Cubit cubit = Scan_Xray_Cubit.get(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorManager.DarkBasiColor(context),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteGenerator.ExmainPageScreen);
                    cubit.Clear_Img();
                  }
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Scan_Xray_Cubit.scan_xray_Img_model?.Img_Xray != null
                          ? Image.file(
                              File(Scan_Xray_Cubit.scan_xray_Img_model!.Img_Xray),
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.5,
                            )
                          : Text('No Image Selected!'),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Scanning your chest X-ray',
                          textAlign: TextAlign.center,
                          style: txtStyle(
                              ColorManager.DarkBasiColor(context), 25.0, true)),
                      SizedBox(
                        height: 40,
                      ),
                      CircularProgressIndicator(
                        color: ColorManager.BlueBasiColor,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: ColorManager.DarkBasiColor(context),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: ColorManager.WitheToDarkColor(context),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RouteGenerator.ResultMlScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
