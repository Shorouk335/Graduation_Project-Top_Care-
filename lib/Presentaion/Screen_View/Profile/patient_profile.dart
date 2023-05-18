import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

class PatientProfile extends StatefulWidget {
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final user = UserPreferences.MyUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          //profile img
          Container(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Center(
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: Ink.image(
                              image: AssetImage('${user.imagePath}'),
                              fit: BoxFit.cover,
                              height: 130,
                              width: 130,
                              child: InkWell(
                                  //  onTap: onClicked,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        user.name,
                        style: txtStyle(ColorManager.BlueBasiColor, 25.0, true),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildBox(tit: "Phone", disc: user.phone),
                      SizedBox(
                        height: 10,
                      ),
                      buildBox(tit: "Location", disc: user.location),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBox({String? tit, String? disc}) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${tit}",
              style: txtStyle(ColorManager.BlueBasiColor, 18.0, true),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: ColorManager.LGrayBasiColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  disc!,
                  style: txtStyle(Colors.black, 15.0, false),
                ),
              ),
            )
          ],
        ),
      );
}

//جزء ال appbar
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new,
            color: ColorManager.DarkBasiColor(context)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
        }),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, RouteGenerator.PetSetting);
        },
        icon: Icon(Icons.settings),
        color: ColorManager.DarkBasiColor(context),
      )
    ],
  );
}

//الداتا بتاعت اليوزر
class User {
  final String imagePath;
  final String name;
  final String phone;
  final String location;
  const User({
    required this.imagePath,
    required this.name,
    required this.phone,
    required this.location,
  });
}

class UserPreferences {
  static const MyUser = User(
    imagePath: 'assets/images/drphoto.png',
    name: 'Dr Ali Rashed',
    phone: '01024141617',
    location: '12thabit st,helwan,cairo',
  );
}
