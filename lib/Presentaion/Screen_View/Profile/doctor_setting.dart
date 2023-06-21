import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Shared_Preferences/Shared_Preferences.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:top_care_gp/presentaion/Shared_Components/Text_Form_Widget.dart';

class DoctorSetting extends StatefulWidget {
  @override
  State<DoctorSetting> createState() => _DoctorSettingState();
}

class _DoctorSettingState extends State<DoctorSetting> {
  DocumentReference DrDocument = FirebaseFirestore.instance
      .collection("Doctor")
      .doc(DataCashHelper.GetData(key: "id"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder(
            stream: DrDocument.snapshots(),
            builder: (context, snapshot) {
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteGenerator.DoctorProfile);
                        },
                        child: Text(
                          "Delete Account",
                          style: txtStyle(Colors.red, 18.0, true),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteGenerator.DoctorProfile);
                        },
                        child: Text(
                          "Cancel",
                          style:
                              txtStyle(ColorManager.BlueBasiColor, 18.0, true),
                        ),
                      ),
                    ],
                  ),
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
                      text: snapshot.data?["email"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Password',
                      onchanged: (password) {},
                      text: snapshot.data?["password"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Phone',
                      onchanged: (phone) {},
                      text: snapshot.data?["phone"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Location',
                      onchanged: (location) {},
                      text: snapshot.data?["location"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Specialization',
                      onchanged: (about) {},
                      text: snapshot.data?["specialization"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Price',
                      onchanged: (about) {},
                      text: snapshot.data?["price"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Number of Experiance\'sYear',
                      onchanged: (about) {},
                      text: "5Y"),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Number of Patient',
                      onchanged: (about) {},
                      text: "2K"),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'First Time',
                      onchanged: (about) {},
                      text: snapshot.data?["FirstTime"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Last Time',
                      onchanged: (about) {},
                      text: snapshot.data?["LastTime"]),
                  SizedBox(
                    height: 6,
                  ),
                  TextFieldWidget(
                      label: 'Working Day',
                      onchanged: (about) {},
                      text: snapshot.data?["working_day"]),
                  SizedBox(
                    height: 20,
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
        image: AssetImage('assets/images/drphoto.png'),
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

  void dispose() {
    controller.dispose();
  }

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
