import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Awesom_Dialog.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Top_Carve.dart';
import 'package:top_care_gp/Resource/Theme/bloc/theme_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var itemAppTheme = AppTheme.values[0];

  Widget iconpage(VoidCallback onTap, IconData icon) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: ColorManager.DarkBasiColor(context),
        size: 30,
      ),
    );
  }

  Widget continerpage(text, Widget widget) {
    return Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$text",
                style: TextStyle(
                  color: ColorManager.DarkBasiColor(context),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget,
            ),
          ],
        ));
  }

  Widget ButtonThame() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: AppTheme.values.length,
      itemBuilder: (context, index) {
        final itemAppTheme = AppTheme.values[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 80,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<ThemeBloc>()
                    .add(ThemeChangedEvent(theme: itemAppTheme));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    ColorManager.DarkBasiColor(context)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text(
                itemAppTheme.name,
                style: txtStyle(
                    ColorManager.WitheToDarkColor(context), 20.0, true),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              TopCarve(context: context, Havetitle: true, title: "Settings"),
              Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.HomeRoute);
                    },
                    icon: Icon(Icons.arrow_back_ios_sharp),
                    color: ColorManager.WitheToDarkColor(context),
                  )),
            ]),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Theme",
                  style: txtStyle(
                      ColorManager.DarkBasiColor(context), 20.0, true)),
            ),
            Expanded(flex: 1, child: ButtonThame()),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  continerpage(
                      "About TopCare",
                      iconpage(() {
                        ShowDialogInfoSetting(context);
                      }, Icons.info_outline_rounded)),
                  continerpage(
                      "Contact Us",
                      iconpage(() {
                        ShowDialogConectSetting(context);
                      }, Icons.connect_without_contact_rounded)),
                ],
              ),
            ),
          ]),
    );
  }
}
