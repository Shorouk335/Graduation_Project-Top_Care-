
import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/PatientQModel.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/SubmitButton.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';


class Patient_sign_up extends StatefulWidget {
  const Patient_sign_up({super.key});

  @override
  State<Patient_sign_up> createState() => _Patient_sign_upState();
}

class _Patient_sign_upState extends State<Patient_sign_up> {
  /// first Row in page its text
  Widget rowtext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Question",
          style: txtStyle(ColorManager.DarkBasiColor, 30.0, true),
          textAlign: TextAlign.start,
        ),
        Text(
          "Yes/No",
          style: txtStyle(ColorManager.DarkBasiColor, 30.0, true),
        ),
      ],
    );
  }

  //Quation
  Widget textQuations(question) {
    return Text(question,
        style: txtStyle(ColorManager.DarkBasiColor, 15.0, true));
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
    double? WIDTH = MediaQuery.of(context).size.width;
    double? BodyHeight = HEIGHT -
        AppBar().preferredSize.height -
        100.0 -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: BodyHeight * 0.1,
                  // ),
                  const Text(
                    "Hello , Please complete your info",
                    style: TextStyle(
                        color: ColorManager.BlueBasiColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: BodyHeight * 0.05,
                  ),
                  rowtext(),
                  Expanded(
                    child: ListView.builder(
                        itemCount: pq.length,
                        //shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  textQuations(pq[index].question),
                                  checkboxx(index),
                                ]),
                          );
                        }),
                  ),
                  submitButton("submit", ()async{
                   await SignUpWithFire(context, email: "Habiba56@gmail.com" ,password: "12345678" );

                  })
                ],
              ),
            ),
          )),
    );
  }
}
