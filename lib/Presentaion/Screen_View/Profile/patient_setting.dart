import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:top_care_gp/presentaion/Shared_Components/Text_Form_Widget.dart';

class PatientSetting extends StatefulWidget {
  @override
  State<PatientSetting> createState() => _PatientSettingState();
}

class _PatientSettingState extends State<PatientSetting> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.MyUser;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RouteGenerator.PetProfile);
                  },
                  child: Text(
                    "Delete Account",
                    style: txtStyle(Colors.red, 18.0, true),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RouteGenerator.PetProfile);
                  },
                  child: Text(
                    "Cancel",
                    style: txtStyle(ColorManager.BlueBasiColor, 18.0, true),
                  ),
                ),
              ],),
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
                label: 'Full Name', onchanged: (name) {}, text: user.name),
            SizedBox(
              height: 6,
            ),
            TextFieldWidget(
                label: 'Email', onchanged: (email) {}, text: user.email),
            SizedBox(
              height: 6,
            ),
            TextFieldWidget(
                label: 'Password',
                onchanged: (password) {},
                text: user.Password),
            SizedBox(
              height: 6,
            ),
            TextFieldWidget(
                label: 'Phone', onchanged: (phone) {}, text: user.phone),
            SizedBox(
              height: 6,
            ),
            TextFieldWidget(
                label: 'Location',
                onchanged: (location) {},
                text: user.location),
            SizedBox(
              height: 6,
            ),
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
        ),
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
          onTap: (){},
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


//الداتا بتاعت اليوزر
class User {
  final String imagePath;
  final String email;
  final String Password;
  final String name;
  final String phone;
  final String location;

  const User(
      {required this.imagePath,
        required this.name,
        required this.phone,


        required this.location,

        required this.Password,
        required this.email});
}

class UserPreferences {
  static const MyUser = User(
      imagePath: 'assets/images/drphoto.png',
      name: 'Dr Ali Rashed',
      phone: '01024141617',
      location: '12thabit st,helwan,cairo',
      email: "ali55@gmail.com",
      Password: "123456789");
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
