import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/Cubit/Scan_Xray_Cubit.dart';
import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Examin/ResultofXray/CommonXrarResult.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Submit_Button.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';

class Result_From_Ml extends StatefulWidget {
  @override
  State<Result_From_Ml> createState() => _Result_From_MlState();
}

class _Result_From_MlState extends State<Result_From_Ml> {
  dynamic img;
  dynamic result;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Scan_Xray_Cubit(),
      child: BlocConsumer<Scan_Xray_Cubit, Scan_Xray_States>(
        listener: (context, states) {},
        builder: (context, states) {
          Scan_Xray_Cubit cubit = Scan_Xray_Cubit.get(context);
          if (Scan_Xray_Cubit.scan_result_from_ml_model?.Result_Text ==
              "Pneumonia") {
            img = "assets/images/Have.png";

            result = "Sorry ,You may have Pneumonia with a probability of ";
          } else {
            img = "assets/images/Normal.png";

            result = "Congratulations, you are Normal with a probability of ";
          }
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
                        context, RouteGenerator.HomeRoute);
                    cubit.Clear_Img();
                    cubit.Clear_Data_From_Ml();
                  }),
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PhotoCard(
                        img!,
                        result!,
                        Scan_Xray_Cubit.scan_result_from_ml_model?.Result_num
                            .toInt()
                            .toString(),
                        context),
                    textofRecommenditon(
                        "We recommend some doctors for you  ", context),
                    submitButton("Share With Doctor ", () {
                      showShareDialog(context);
                    }, double.infinity, 60)
                  ],
                )),
          );
        },
      ),
    );
  }

}
