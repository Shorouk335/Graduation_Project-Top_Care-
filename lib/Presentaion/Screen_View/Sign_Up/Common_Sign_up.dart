import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/TextFormWidget.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Log_In.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = true;
  bool Checkvalue = false;
  IconData PasswordIcon = Icons.lock;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? username = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Sign Up',
                  style: txtStyle(ColorManager.CyneColordark, 30.0, true),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Welcom back! please enter your details',
                  style: txtStyle(ColorManager.GrayColorLight, 15.0, false),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                TextFormWidget(
                    txt: "user name",
                    icon: Icons.person,
                    password: false,
                    controller: username),
                SizedBox(
                  height: 15,
                ),
                TextFormWidget(
                    txt: "email",
                    icon: Icons.email,
                    password: false,
                    controller: email),
                SizedBox(
                  height: 15,
                ),
                TextFormWidget(
                    txt: "password",
                    icon: PasswordIcon,
                    password: hidePassword,
                    controller: password,
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
                Row(
                  children: [
                    Checkbox(
                        activeColor: ColorManager.CyneColordark,
                        checkColor: Colors.white,
                        value: Checkvalue,
                        onChanged: (Checkvalue) {
                          setState(() {
                            this.Checkvalue = !this.Checkvalue;
                          });
                        }),
                    Text(
                      "Remamber",
                      style: txtStyle(ColorManager.GrayColorLight, 15.0, false),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate())
                        SignUpWithFire(context,
                            email: email!.text, password: password!.text);
                      else
                        return null;
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorManager.CyneColordark),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: txtStyle(Colors.white, 25.0, false),
                      )),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Already Have an Account?",
                      style: txtStyle(ColorManager.CyneColordark, 15.0, false),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RouteGenerator.LoginRoute);
                      },
                      child: Text(
                        "Sign In",
                        style:
                            txtStyle(ColorManager.CyneColordark, 15.0, false),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 20,),
                    Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                      size: 40,
                    ),
                    SizedBox(width: 20,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
