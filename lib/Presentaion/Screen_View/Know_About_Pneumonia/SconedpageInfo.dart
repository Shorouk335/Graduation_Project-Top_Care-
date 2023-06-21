import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/GeneralInfoPhenModel.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';

class SconedpageInfo extends StatelessWidget {
  GeneralInfoPhenModel model;

  SconedpageInfo({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.DarkBasiColor(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              model.img,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  model.title,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.DarkBasiColor(context)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                model.subtitle,
                style: TextStyle(
                    fontSize: 20.0, color: ColorManager.DarkBasiColor(context)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Additional More  details :\n\n${model.detailes}',
                style: TextStyle(
                    fontSize: 20.0, color: ColorManager.DarkBasiColor(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
