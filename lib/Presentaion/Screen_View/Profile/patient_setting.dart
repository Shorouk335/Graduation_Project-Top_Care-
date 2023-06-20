import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Shared_Preferences/Shared_Preferences.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:top_care_gp/presentaion/Shared_Components/Text_Form_Widget.dart';

class PatientSetting extends StatefulWidget {
  @override
  State<PatientSetting> createState() => _PatientSettingState();
}

class _PatientSettingState extends State<PatientSetting> {
  DocumentReference PeDocument = FirebaseFirestore.instance
      .collection(DataCashHelper.GetData(key: "Type").toString())
      .doc(DataCashHelper.GetData(key: "id"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.WitheToDarkColor(context),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () async {
            Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: ColorManager.DarkBasiColor(context),
        ),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: Icon(
              Icons.delete_forever,
              size: 28,
            ),
            color: Colors.red,
          ),
          IconButton(
            onPressed: () async {
              await DataCashHelper.DeleteData(key: "id");
              await DataCashHelper.DeleteData(key: "Type");
              await SignOut(context);
            },
            icon: Icon(Icons.logout),
            color: ColorManager.DarkBasiColor(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder(
            stream: PeDocument.snapshots(),
            builder: (context, snapshot) {
              return ListView(
                children: [
                  //جزء الصورة الويدجت بتاعتها تحت ف الكود
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        buildImage(),
                        buildEditIcon(context),
                      ],
                      //
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      label: 'Full Name',
                      onchanged: (name) {},
                      text: snapshot.data?["username"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Email',
                      onchanged: (email) {},
                      text: snapshot.data?["email"] ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Password',
                      onchanged: (password) {},
                      text: snapshot.data?["password"] ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Phone',
                      onchanged: (phone) {},
                      text: snapshot.data?["phone"] ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'gender',
                      onchanged: (gender) {},
                      text: snapshot.data?["gender"]),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: ColorManager.BlueBasiColor,
                      ),
                      child: Center(
                        child: Text(
                          "Save Changed",
                          style: txtStyle(Colors.white, 20.0, true),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

// جزء الصورة بتاعت البروفايل

Widget buildImage() {
  return ClipOval(
    child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: AssetImage('assets/images/patient.jpeg'),
        fit: BoxFit.cover,
        height: 120,
        width: 120,
        child: InkWell(
          onTap: () {},
        ),
      ),
    ),
  );
}

Widget buildEditIcon(BuildContext context) {
  return ClipOval(
    child: Container(
      padding: EdgeInsets.all(5),
      color: ColorManager.WitheToDarkColor(context),
      child: Icon(
        Icons.add_a_photo_outlined,
        color: ColorManager.BlueBasiColor,
        size: 25,
      ),
    ),
  );
}

class TextFieldWidget extends StatefulWidget {
  final String label;
  final int maxLines;
  final String text;
  final ValueChanged<String> onchanged;
  TextFieldWidget(
      {required this.label,
      this.maxLines = 3,
      required this.onchanged,
      required this.text});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
  }
  //
  // void dispose() {
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.label,
            style: txtStyle(ColorManager.BlueBasiColor, 16.0, true),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormWithoutIcon(controller: controller),
      ],
    );
  }
}
