import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/AwesomDialog.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/TopCarve.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool statuslang = false;
  Widget togglebuttonlang(String activetext, String inactivetext) {
    return FlutterSwitch(
      activeText: activetext,
      inactiveText: inactivetext,
      activeTextColor: ColorManager.BlueBasiColor,
      inactiveTextColor: ColorManager.DarkBasiColor,
      activeColor: ColorManager.DarkBasiColor,
      inactiveColor: ColorManager.BlueBasiColor,
      width: 100.0,
      height: 40.0,
      valueFontSize: 15.0,
      toggleSize: 30.0,
      value: statuslang,
      borderRadius: 30.0,
      padding: 8.0,
      showOnOff: true,
      onToggle: (val) {
        setState(() {
          statuslang = val;
        });
      },
    );
  }

  bool statustheme = false;
  Widget togglebuttheme(String activetext, String inactivetext) {
    return FlutterSwitch(
      activeText: activetext,
      inactiveText: inactivetext,
      activeTextColor: ColorManager.BlueBasiColor,
      inactiveTextColor: ColorManager.DarkBasiColor,
      activeColor: ColorManager.DarkBasiColor,
      inactiveColor: ColorManager.BlueBasiColor,
      width: 100.0,
      height: 40.0,
      valueFontSize: 15.0,
      toggleSize: 30.0,
      value: statustheme,
      borderRadius: 30.0,
      padding: 8.0,
      showOnOff: true,
      onToggle: (val) {
        setState(() {
          statustheme = val;
        });
      },
    );
  }

  Widget iconpage(VoidCallback onTap, IconData icon) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: ColorManager.DarkBasiColor,
        size: 30,
      ),
    );
  }

  Widget continerpage(text, Widget widget) {
    return Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorManager.DGrayBasiColor,
                width: 2.0,
              ),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$text",
                style: txtStyle(ColorManager.DarkBasiColor, 20.0, true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    double? HEIGHT = MediaQuery.of(context).size.height;
    double? WIDTH = MediaQuery.of(context).size.width;
    double? BodyHeight = HEIGHT -
        AppBar().preferredSize.height -
        100.0 -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: Stack(children: <Widget>[
          TopCarve(context: context, Havetitle: true, title: "Setting"),
          Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.HomeRoute);
                },
                icon: Icon(Icons.arrow_back_ios_sharp),
                color: ColorManager.DarkBasiColor,
              )),
        ]),
      ),
        body: Column(
            children: [
          continerpage("Theme", togglebuttheme("Dark", "Light")),
          continerpage("language", togglebuttonlang("En", "Ar")),
          continerpage(
              "About TopCare",
              iconpage(() {
                showDialoginf(context);
              }, Icons.info_outline_rounded)),
          continerpage(
              "Contact Us",
              iconpage(() {
                showDialogconect(context);
              }, Icons.connect_without_contact_rounded)),
        ]),

    );
  }
}
