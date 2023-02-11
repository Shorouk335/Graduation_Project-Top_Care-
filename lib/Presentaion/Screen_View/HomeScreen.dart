import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/CategoryModel.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Firebase/store.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/CurvedBottomNav.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/TextFormWidget.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/String_Manager/String_Manager.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';


// Home Page
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List of data of category from CategoryModel
  List<CategoryModel> Category = [
    CategoryModel(img: AssetManager.findDr, title: StringManager.CategoryTxt1),
    CategoryModel(img: AssetManager.xray, title: StringManager.CategoryTxt2),
    CategoryModel(img: AssetManager.pharmacy, title: StringManager.CategoryTxt4),
    CategoryModel(img: AssetManager.information, title: StringManager.CategoryTxt3),
  ];

  @override
  Widget build(BuildContext context) {
    double? HEIGHT = MediaQuery.of(context).size.height;
    double? WIDTH = MediaQuery.of(context).size.width;
    double? BodyHeight =
     HEIGHT- AppBar().preferredSize.height -100.0 - MediaQuery.of(context).padding.top ;
    // Widgets of body
    Widget FirstWidget (){
      return Container(
        width: WIDTH,
        height: BodyHeight*0.1,
        child: Row(
          children: [
            Text(" Welcom",
                style: txtStyle(ColorManager.DarkBasiColor, 30.0, true)),
            Spacer(),
            IconButton(
                onPressed: ()async {
                  await SignOut(context);
                },
                icon: Icon(
                  Icons.notifications_none,
                  color: ColorManager.DarkBasiColor,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.tune,
                  color: ColorManager.DarkBasiColor,
                  size: 30,
                ))
          ],
        ),
      );
    } //0.1
    Widget EmergancyWidget (){
      return Container(
        height: BodyHeight*0.25,
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
                style: txtStyle(ColorManager.DarkBasiColor, 20.0, true),
              ),
              Text(
                "for helping you in anemergency , please add\nthe number of the nearest hospital of you\n or the numbers of your relatives !",
                style:
                txtStyle(ColorManager.LBlueBasiColor, 15.0, false),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_in_talk,
                    color: ColorManager.DarkBasiColor,
                    size: 35,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: ColorManager.LBlueBasiColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                          "Emergency",
                          style: txtStyle(
                              ColorManager.DarkBasiColor, 18.0, true),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }//0.25
    Widget CategoryWidget (){
      return Container(
        height: BodyHeight*0.4,
        child: ListView.builder(
          itemCount: Category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
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
                                  color: ColorManager.BlueBasiColor
                                      .withOpacity(0.5),
                                  blurRadius: 1.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
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
                                        ColorManager.DarkBasiColor,
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
    }//0.4
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Welcom & icon notification & icon setting
              FirstWidget(),
              // search
              Container(
                height: BodyHeight*0.1,
                child: TextFormWidget(
                    controller: TextEditingController(),
                    icon: Icons.search_sharp,
                    txt: "Search",
                    password: false,
                    ontap: () {}),
              ),//0.1
              SizedBox(height: BodyHeight*0.025,), //0.025
              //emergancy + call
              EmergancyWidget(),
              SizedBox(height: BodyHeight*0.025,), //0.025
              // text category
              Container(
                  height: BodyHeight*0.1,
                  child: Text("Category", style: txtStyle(ColorManager.DarkBasiColor, 35.0, true),)), //0.1
              // Find Dr & x ray & pharmacy & know about
              CategoryWidget(),
            ],
          )),
        ),
      ),
      // CurvedBottomNav in the bottom
      bottomNavigationBar: CurvedBottomNav(context),
    );

  }





}
