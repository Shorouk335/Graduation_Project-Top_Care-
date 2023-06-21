import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/Cubit/Scan_Xray_Cubit.dart';
import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';
import 'package:top_care_gp/Data/Models/CategoryModel.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Curved_Bottom_Nav.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Text_Form_Widget.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/String_Manager/String_Manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

// Home Page
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List of data of category from CategoryModel
  @override
  Widget build(BuildContext context) {
    double? HEIGHT = MediaQuery.of(context).size.height;
    double? WIDTH = MediaQuery.of(context).size.width;
    double? BodyHeight = HEIGHT -
        AppBar().preferredSize.height -
        100.0 -
        MediaQuery.of(context).padding.top;
    List<CategoryModel> Category = [
      CategoryModel(
          img: AssetManager.Scan,
          title: StringManager.CategoryTxt1,
          on: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.ExmainPageScreen);
          }),
      CategoryModel(
          img: AssetManager.findDr,
          title: StringManager.CategoryTxt2,
          on: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.FindDoctorHScreen);
          }),
      CategoryModel(
          img: AssetManager.xray, title: StringManager.CategoryTxt3, on: () {}),
      CategoryModel(
          img: AssetManager.information,
          title: StringManager.CategoryTxt4,
          on: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.KnowAboutPheumoniaScreen);
          }),
      CategoryModel(
          img: AssetManager.pharmacy,
          title: StringManager.CategoryTxt5,
          on: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.PharmacyScreen);
          }),
    ];
    // Widgets of body
    Widget FirstWidget() {
      return BlocProvider(
        create: (BuildContext context) => Scan_Xray_Cubit(),
        child: BlocConsumer<Scan_Xray_Cubit, Scan_Xray_States>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              width: WIDTH,
              height: BodyHeight * 0.1,
              child: Row(
                children: [
                  Text(" Welcome",
                      style: txtStyle(
                          ColorManager.DarkBasiColor(context), 33.0, true)),
                  Spacer(),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      IconButton(
                          onPressed: () async {
                            Navigator.pushReplacementNamed(
                                context, RouteGenerator.NotificationScreen);
                          },
                          icon: Icon(
                            Icons.notifications_none,
                            color: ColorManager.DarkBasiColor(context),
                            size: 37,
                          )),
                      CircleAvatar(
                        backgroundColor: Scan_Xray_Cubit.NotificationColor,
                        radius: 8,
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouteGenerator.Settingscreen);
                      },
                      icon: Icon(
                        Icons.tune,
                        color: ColorManager.DarkBasiColor(context),
                        size: 37,
                      ))
                ],
              ),
            );
          },
        ),
      );
    } //0.1

    Widget EmergancyWidget() {
      return Container(
        height: BodyHeight * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorManager.BlueBasiColor.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "  Are you felling sick ?",
                style: txtStyle(ColorManager.DarkColorOnly, 20.0, true),
              ),
              Text(
                "for helping you in anemergency , please add\nthe number of the nearest hospital of you\n or the numbers of your relatives !",
                style: txtStyle(ColorManager.LBlueBasiColor, 15.0, false),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      UrlLauncher.launch("tel://${AssetManager.FavoriteNum}");
                    },
                    icon: Icon(
                      Icons.phone_in_talk,
                      color: ColorManager.DarkColorOnly,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.Emergencyscreen);
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: ColorManager.LBlueBasiColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        "Emergency",
                        style: txtStyle(ColorManager.DarkColorOnly, 18.0, true),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    } //0.25

    Widget CategoryWidget() {
      return Container(
        height: BodyHeight * 0.4,
        child: ListView.builder(
          itemCount: Category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                // onpreased by index category1
                InkWell(
                  onTap: Category[index].on,
                  child: Container(
                    width: WIDTH / 2.1,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Container(
                          height: 15.0,
                          color: Colors.transparent,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: WIDTH / 2.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorManager.LBlueBasiColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.BlueBasiColor,
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.5, //extend the shadow
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                  )
                                ],
                              ),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Text(
                                      "${Category[index].title}",
                                      style: txtStyle(
                                          ColorManager.DarkColorOnly,
                                          20.0,
                                          true),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Image(
                          image: AssetImage("${Category[index].img}"),
                          height: 110.0,
                          width: 130.0,
                        )))
              ],
            );
          },
        ),
      );
    } //0.4

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Welcom & icon notification & icon setting
                FirstWidget(),
                // search
                Container(
                  height: BodyHeight * 0.1,
                  child: LargeTextFormWidget(
                      controller: TextEditingController(),
                      icon: Icons.search_sharp,
                      txt: "Search",
                      password: false,
                      ontap: () {}),
                ), //0.1
                SizedBox(
                  height: BodyHeight * 0.025,
                ), //0.025
                //emergancy + call
                EmergancyWidget(),
                SizedBox(
                  height: BodyHeight * 0.025,
                ), //0.025
                // text category
                Container(
                    height: BodyHeight * 0.1,
                    child: Text(
                      "Category",
                      style: txtStyle(
                          ColorManager.DarkBasiColor(context), 35.0, true),
                    )), //0.1
                // Find Dr & x ray & pharmacy & know about
                CategoryWidget(),
              ],
            )),
          ),
        ),
      ),

      // CurvedBottomNav in the bottom
      bottomNavigationBar: CurvedBottomNav(context),
    );
  }
}
