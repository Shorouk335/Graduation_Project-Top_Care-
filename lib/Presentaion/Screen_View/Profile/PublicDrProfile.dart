import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/Cubit/FindDoctorCubit.dart';
import 'package:top_care_gp/Business_Logic/States/Find_Dr_State.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Circular_Img.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

class PublicDrProfile extends StatefulWidget {
  @override
  State<PublicDrProfile> createState() => _PublicDrProfileState();
}

class _PublicDrProfileState extends State<PublicDrProfile> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => Find_Dr_Cubit(),
      child: BlocConsumer<Find_Dr_Cubit, Find_Dr_State>(
          listener: (context, states) {},
          builder: (context, states) {
            return  Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              child: Column(
                children: [
                  CircularImg(img: "${Find_Dr_Cubit.model!.img}",height: 130.0,width: 130.0),
                  SizedBox(height: 10,),
                  Text(
                    "${Find_Dr_Cubit.model!.name}",
                    style: txtStyle(ColorManager.BlueBasiColor, 25.0, true),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.BlueBasiColor,
                    ),
                    child: Center(
                      child: Text('${Find_Dr_Cubit.model!.price}',
                        style: txtStyle(Colors.white, 15.0, true),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
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
                            '2K',
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
                            '5y',
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
                            '${Find_Dr_Cubit.model!.rate}',
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
                  buildBox(tit: "Specialization",disc: "${Find_Dr_Cubit.model!.Specialization}"),
                  SizedBox(
                    height: 10,
                  ),
                  buildBox(tit: "Phone",disc: "${Find_Dr_Cubit.model!.Phone}"),
                  SizedBox(
                    height: 10,
                  ),
                  buildBox(tit: "Location",disc:"${Find_Dr_Cubit.model!.Location}"),
                  SizedBox(
                    height: 10,
                  ),
                  buildBox(tit: "Working Day",disc:"${Find_Dr_Cubit.model!.Working_Day}" ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' Time',
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
                          child: Text('${Find_Dr_Cubit.model!.FirstTime}',
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
                          child: Text('${Find_Dr_Cubit.model!.LastTime}',
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
      ); }
            ),
            );
  }


  Widget buildBox({String? tit , String? disc}) => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " ${tit}",
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
          Navigator.pushReplacementNamed(context, RouteGenerator.FindDoctorHScreen);
        }),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}


