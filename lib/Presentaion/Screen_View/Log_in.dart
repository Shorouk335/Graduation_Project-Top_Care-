import 'package:flutter/material.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Submit_Button.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:top_care_gp/presentaion/Shared_Components/Text_Form_Widget.dart';
import '../../Resource/color_manager/color_manager.dart';

class Log_in extends StatefulWidget {
  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  bool hidePassword = true;
  bool Checkvalue = false;
  IconData PasswordIcon = Icons.lock;
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  //Img +Login + words
  Widget StartText() {
    return Column(
      children: [
        Image.asset(
          AssetManager.sign,
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
        Text(
          'Log In',
          style:
              txtStyle(ColorManager.BlueBasiColor, 30.0, true),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Welcome back! Please enter your details',
          style: txtStyle(ColorManager.DGrayBasiColor, 15.0, false),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  // textformfeild for email and password
  Widget EnterForm() {
    return Column(
      children: [
        TextFormWidget(
            txt: "email",
            icon: Icons.email,
            password: false,
            controller: emailController),
        SizedBox(
          height: 20,
        ),
        TextFormWidget(
            txt: "password",
            icon: PasswordIcon,
            password: true,
            controller: passController,
            ontap: () {
              setState(() {
                hidePassword = !hidePassword;
                (hidePassword)
                    ? (PasswordIcon = Icons.lock)
                    : (PasswordIcon = Icons.lock_open);
              });
            }),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  //remember check box
  Widget Remember() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                activeColor: ColorManager.BlueBasiColor,
                checkColor: Colors.white,
                shape: CircleBorder(),
                value: Checkvalue,
                onChanged: (Checkvalue) {
                  setState(() {
                    this.Checkvalue = !this.Checkvalue;
                  });
                }),
            Text(
              'Remember ',
              style: TextStyle(
                fontSize: 13,
                color: ColorManager.DarkBasiColor(context),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  //create account or forget password
  Widget EndText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.Common_SignUpRoute);
          },
          child: Text(
            'Create an account?',
            style: txtStyle(
                ColorManager.BlueBasiColor, 15.0, false),
          ),
        ),
        Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(
              'Forget Password !',
              style: txtStyle(
                  ColorManager.BlueBasiColor.withOpacity(0.8), 15.0, false),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StartText(),
                      EnterForm(),
                      Remember(),
                      //Botton to log in by fire base auth
                      submitButton(
                        'Log In',
                        () async {
                          if (formkey.currentState!.validate()) {
                            await LogInWithFire(context,
                                email: emailController.text,
                                password: passController.text);
                          }
                          return null;
                        },
                      ),
                      EndText()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
