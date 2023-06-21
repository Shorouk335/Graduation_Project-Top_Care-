import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/Cubit/Scan_Xray_Cubit.dart';

import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Notification/Notification_Style.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Top_Carve.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

class Notification_Page extends StatefulWidget {
  const Notification_Page({Key? key}) : super(key: key);

  @override
  State<Notification_Page> createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Scan_Xray_Cubit(),
      child: BlocConsumer<Scan_Xray_Cubit, Scan_Xray_States>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    TopCarve(
                        context: context,
                        Havetitle: true,
                        title: "Notification"),
                    Positioned(
                        top: 50,
                        left: 20,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RouteGenerator.HomeRoute);
                            Scan_Xray_Cubit().NoNotificationColor();
                          },
                          icon: Icon(Icons.arrow_back_ios_sharp),
                          color: ColorManager.WitheToDarkColor(context),
                        )),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 180,
                  child: (Scan_Xray_Cubit.Notification_List.isEmpty)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_on,
                              size: 100.0,
                              color: ColorManager.BlueBasiColor,
                            ),
                            Text(
                              "No Notification Yet !!",
                              style: txtStyle(
                                  ColorManager.BlueBasiColor, 20.0, false),
                            ),
                            SizedBox(
                              height: 150,
                            ),
                          ],
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: Scan_Xray_Cubit.Notification_List.length,
                          itemBuilder: (context, index) {
                            if (Scan_Xray_Cubit
                                .Notification_List[index].IconTxt!
                                .contains("View Result")) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: View_Result_Patient_Notification(
                                    img: Scan_Xray_Cubit
                                        .Notification_List[index].img,
                                    name: Scan_Xray_Cubit
                                        .Notification_List[index].name,
                                    IconTxt: Scan_Xray_Cubit
                                        .Notification_List[index].IconTxt,
                                    Time: Scan_Xray_Cubit
                                        .Notification_List[index].Time,
                                    context: context),
                              );
                            } else if (Scan_Xray_Cubit
                                .Notification_List[index].IconTxt!
                                .contains("View Scan  ")) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: View_Scan_Doctor_Notification(
                                    img: Scan_Xray_Cubit
                                        .Notification_List[index].img,
                                    name: Scan_Xray_Cubit
                                        .Notification_List[index].name,
                                    IconTxt: Scan_Xray_Cubit
                                        .Notification_List[index].IconTxt,
                                    Time: Scan_Xray_Cubit
                                        .Notification_List[index].Time,
                                    context: context),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Public_Patient_Notification(
                                  context: context,
                                  img: Scan_Xray_Cubit
                                      .Notification_List[index].img,
                                  name: Scan_Xray_Cubit
                                      .Notification_List[index].name,
                                  IconTxt: Scan_Xray_Cubit
                                      .Notification_List[index].IconTxt,
                                  Time: Scan_Xray_Cubit
                                      .Notification_List[index].Time,
                                ),
                              );
                            }
                          },
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
