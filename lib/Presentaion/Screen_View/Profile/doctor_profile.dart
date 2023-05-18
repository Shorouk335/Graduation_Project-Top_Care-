import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

class DocProfile extends StatefulWidget {
  @override
  State<DocProfile> createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
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
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.35,
                    ),
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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //name & spec & price
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.32,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.name,
                            style: txtStyle(ColorManager.BlueBasiColor, 25.0, true),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            user.specialization,
                            style: txtStyle(ColorManager.DarkBasiColor(context), 20.0, false),
                            //style: txtStyle(Colors.grey, 20, true),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 40,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.BlueBasiColor,
                      ),
                      child: Center(
                        child: Text('${user.price}',
                            style: txtStyle(Colors.white, 15.0, true),
                      ),
                    ),
                    ),
                    Spacer(),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                // الجزء بتاع الايكونات ف البروفايل فوق
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //patient
                    Column(
                      children: [
                        Icon(
                          Icons.people_alt,
                          color: ColorManager.BlueBasiColor,
                          size: 20,
                        ),
                        Text(
                          'Patient',
                          style: TextStyle(color: ColorManager.BlueBasiColor, fontSize: 17),
                        ),
                        Text(
                          '${user.num_patient}',
                          style: TextStyle(
                              color: ColorManager.DarkBasiColor(context),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.work,
                          color: ColorManager.BlueBasiColor,
                          size: 20,
                        ),
                        Text(
                          'Experience',
                          style: TextStyle(  color: ColorManager.BlueBasiColor,
                              fontSize: 17),
                        ),
                        Text(
                          '${user.num_experiance}',
                          style: TextStyle(
                              color: ColorManager.DarkBasiColor(context),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.star_half,
                          color: ColorManager.BlueBasiColor,
                          size: 20,
                        ),
                        Text(
                          'Rating',
                          style: TextStyle(color: ColorManager.BlueBasiColor, fontSize: 17),
                        ),
                        Text(
                          '${user.rate}',
                          style: TextStyle(
                              color: ColorManager.DarkBasiColor(context),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBox(tit: "About",disc: user.about),
                SizedBox(
                  height: 10,
                ),
                buildBox(tit: "Phone",disc: user.phone),
                SizedBox(
                  height: 10,
                ),
                buildBox(tit: "Location",disc: user.location),
                SizedBox(
                  height: 10,
                ),
                buildBox(tit: "Working Day",disc: user.Working_day.toString()),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Time',
                  style: TextStyle(
                      color: ColorManager.BlueBasiColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.BlueBasiColor,
                      ),
                      child: Center(
                        child: Text('${user.first_time}',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.BlueBasiColor,
                      ),
                      child: Center(
                        child: Text('${user.last_time}',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //الجزء بتاع about
  Widget buildBox({String? tit , String? disc}) => Container(
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
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color:ColorManager.LGrayBasiColor,
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
          Navigator.pushReplacementNamed(context, RouteGenerator.DocSetting);
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
  final String specialization;
  final String about;
  final String location;
  final String num_patient;
  final String num_experiance;
  final String rate;
  final String price;
  final String first_time;
  final String last_time;
  final List Working_day;
  const User(
      {required this.imagePath,
      required this.name,
      required this.phone,
      required this.specialization,
      required this.about,
      required this.location,
      required this.num_experiance,
        required this.num_patient,
        required this.rate,
        required this.price,
        required this.first_time,
        required this.last_time,
        required this.Working_day,
      
      });
}

class UserPreferences {
  static const MyUser = User(
    imagePath: 'assets/images/drphoto.png',
    name: 'Dr Ali Rashed',
    phone: '01024141617',
    specialization: 'Sr.Cardiolodist',
    about: 'kjkj nxjx nxjjx kkjn ',
    location: '12thabit st,helwan,cairo',
    num_experiance: "5Y",
    num_patient: "2K",
    rate: "7.5",
    first_time: "10:00 pm",
    last_time: "02:00 pm",
    price: "250LE",
    Working_day: ["Sat",   "Sun"  ,   "Mon" ,    "Tue"     , "Wen"]
  );
}
