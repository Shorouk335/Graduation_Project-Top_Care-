import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/Cubit/Common_sign_up_Cubit.dart';
import 'package:top_care_gp/Business_Logic/Cubit/Scan_Xray_Cubit.dart';
import 'package:top_care_gp/Business_Logic/States/Common_sign_up_State.dart';
import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';
import 'package:top_care_gp/Data/Models/PatientQModel.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Submit_Button.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

import '../../../../Resource/Routes/Routes.dart';

class Patient_Question extends StatefulWidget {
  const Patient_Question({super.key});

  @override
  State<Patient_Question> createState() => _Patient_QuestionState();
}

class _Patient_QuestionState extends State<Patient_Question> {
  //welcom text in page
  Widget firstText() {
    return Text(' "Please answer this Questions" ',
        style: txtStyle(ColorManager.BlueBasiColor, 20.0, true));
  }

  // Question yes or no line
  Widget QuestionTextline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Question",
          style: txtStyle(ColorManager.DarkBasiColor(context), 30.0, true),
          textAlign: TextAlign.start,
        ),
        Text(
          "Yes/No",
          style: txtStyle(ColorManager.DarkBasiColor(context), 30.0, true),
        ),
      ],
    );
  }

  //Quation
  Widget textQuations(question) {
    return Text(question,
        style: txtStyle(ColorManager.DarkBasiColor(context), 15.0, true));
  }

// select checkbox

  List<PatientQModel> pq = [
    PatientQModel(
      "Diabetes",
    ),
    PatientQModel(
      "High blood pressur",
    ),
    PatientQModel(
      "tonre disease",
    ),
    PatientQModel(
      "Changes in bowel/bladder habits",
    ),
    PatientQModel(
      'Lung problem ditticulty breathi',
    ),
    PatientQModel('Do you have pain 24 hours '),
    PatientQModel('Are vou avakened at '),
    PatientQModel('Changes in stool color '),
    PatientQModel('Indigescion or neaLdoun'),
    PatientQModel('prequent urination'),
    PatientQModel('Frequent cranoina'),
  ];

  //list to add what is checked
  List<String> checkeduserQuat = [];

  onSelected(bool selected, String dataName) {
    if (selected == true) {
      setState(() {
        checkeduserQuat.add(dataName);
      });
    } else {
      setState(() {
        checkeduserQuat.remove(dataName);
      });
    }
  }

  //checkbox
  Widget checkboxx(i) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Checkbox(
        value: checkeduserQuat.contains(pq[i].question),
        activeColor: ColorManager.BlueBasiColor,
        shape: CircleBorder(),
        onChanged: (bool? value) {
          setState(() {
            onSelected(value!, pq[i].question);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double? HEIGHT = MediaQuery.of(context).size.height;
    double? BodyHeight = HEIGHT -
        AppBar().preferredSize.height -
        100.0 -
        MediaQuery.of(context).padding.top;

    return BlocProvider(
        create: (BuildContext context) => Scan_Xray_Cubit(),
        child: BlocConsumer<Scan_Xray_Cubit, Scan_Xray_States>(
            listener: (context, state) {},
            builder: (context, state) {
              Scan_Xray_Cubit cubit = Scan_Xray_Cubit.get(context);
              return Scaffold(
                body: SafeArea(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        firstText(),
                        SizedBox(
                          height: BodyHeight * 0.05,
                        ),
                        QuestionTextline(),
                        Expanded(
                          child: ListView.builder(
                              itemCount: pq.length,
                              //shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        textQuations(pq[index].question),
                                        checkboxx(index),
                                      ]),
                                );
                              }),
                        ),
                        submitButton("Send to Doctor", () async {
                          Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
                          cubit.Clear_Img();
                          cubit.Clear_Data_From_Ml();
                        },   350.0 ,40.0

                        )
                      ],
                    ),
                  ),
                )),
              );
            }));
  }
}
