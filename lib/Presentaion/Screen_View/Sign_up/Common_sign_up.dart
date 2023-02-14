import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';
import '../../../Resource/color_manager/color_manager.dart';
import '../../Shared_Components/TextFormWidget.dart';

class Common_sign_up extends StatefulWidget {
  @override
  State<Common_sign_up> createState() => _Common_sign_upState();
}

class _Common_sign_upState extends State<Common_sign_up> {
  bool hidePassword = true;
  bool Checkvalue = false;
  bool Checkvalue1 = false;
  IconData PasswordIcon = Icons.lock;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  //img & log in words
  Widget FirstContent() {
    return Column(
      children: [
        Image.asset(
          AssetManager.sign,
          height: 150,
          width: 150,
        ),
        Text(
          'Sign Up',
          style:
              txtStyle(ColorManager.BlueBasiColor, 30.0, true),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Welcome ! Please enter your details',
          style: txtStyle(ColorManager.DGrayBasiColor, 15.0, false),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  //name & email & password & phone form
  Widget EnterForm() {
    return Column(
      children: [
        TextFormWidget(
            txt: "user name",
            icon: Icons.person,
            password: false,
            controller: nameController),
        SizedBox(
          height: 20,
        ),
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
            password: hidePassword,
            controller: passController,
            ontap: () {
              setState(() {
                hidePassword = !hidePassword;
                (hidePassword)
                    ? (PasswordIcon = Icons.lock)
                    : (PasswordIcon = Icons.lock_open);
                passController = passController;
              });
            }),
        SizedBox(
          height: 20,
        ),
        TextFormWidget(
            txt: "phone",
            icon: Icons.phone,
            password: false,
            controller: phoneController),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  // gender check
  Widget Gender() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  'Male',
                  style: txtStyle(ColorManager.DGrayBasiColor, 15.0, true),
                ),
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
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: [
                Text(
                  'Female',
                  style: txtStyle(ColorManager.DGrayBasiColor, 15.0, true),
                ),
                Checkbox(
                    activeColor: ColorManager.BlueBasiColor,
                    checkColor: Colors.white,
                    shape: CircleBorder(),
                    value: Checkvalue1,
                    onChanged: (Checkvalue1) {
                      setState(() {
                        this.Checkvalue1 = !this.Checkvalue1;
                      });
                    }),
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  //dr or patient
  Widget Type() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: ColorManager.BlueBasiColor,
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.Dr_SignUpRoute);
                }
                return null;
              },
              child: Text(
                "DOCTOR",
                style: txtStyle(Colors.white, 20.0, true),
              ),
            ),
          ),
        ),
        Text(
          "OR",
          style: txtStyle(ColorManager.DGrayBasiColor, 20.0, true),
        ),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: ColorManager.BlueBasiColor,
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                if (formkey.currentState!.validate())
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.Patient_SignUpRoute);
                else
                  return null;
              },
              child: Text(
                "PATIENT",
                style: txtStyle(Colors.white, 20.0, true),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FirstContent(),
                    EnterForm(),
                    Gender(),
                    Type(),
                    SizedBox(
                      height: 10,
                    ),
                    //if user have an account
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RouteGenerator.LoginRoute);
                          },
                          child: Text(
                            'Already Have an account!',
                            style: txtStyle(
                                ColorManager.BlueBasiColor.withOpacity(0.8),
                                15.0,
                                false),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
