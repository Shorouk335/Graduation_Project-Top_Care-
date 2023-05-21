import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/Cubit/FindDoctorCubit.dart';
import 'package:top_care_gp/Business_Logic/States/Find_Dr_State.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Circular_Img.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Text_Form_Widget.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Top_Carve.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher ;

class FindDoctorHome extends StatefulWidget {
  @override
  State<FindDoctorHome> createState() => _FindDoctorHomeState();
}

class _FindDoctorHomeState extends State<FindDoctorHome> {
  TextEditingController searchDr = TextEditingController();

  Color FavDrColor = ColorManager.DGrayBasiColor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Find_Dr_Cubit(),
      child: BlocConsumer<Find_Dr_Cubit, Find_Dr_State>(
          listener: (context, states) {},
          builder: (context, states) {
            Find_Dr_Cubit cubit = Find_Dr_Cubit.get(context);
            return Scaffold(
              body: Column(
                children: [
                  Stack(
                    children: [
                      TopCarve(
                          Havetitle: false,
                          context: context,
                          content: SearchDr()),
                      Positioned(
                          top: 50,
                          left: -10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RouteGenerator.HomeRoute);
                            },
                            icon: Icon(Icons.arrow_back_ios_sharp),
                            color: ColorManager.WitheToDarkColor(context),
                          )),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                        itemCount: Find_Dr_Cubit.FindDrList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                cubit.OpenProfile(index!);
                                Navigator.pushReplacementNamed(context, RouteGenerator.PublicProfileScreen);
                              },
                              child: DoctorBox(
                                index: index,
                                img: Find_Dr_Cubit.FindDrList[index].img,
                                name: Find_Dr_Cubit.FindDrList[index].name,
                                disc: Find_Dr_Cubit.FindDrList[index].disc,
                                price: Find_Dr_Cubit.FindDrList[index].price,
                                Location:Find_Dr_Cubit.FindDrList[index].Location,
                                FirstTime: Find_Dr_Cubit.FindDrList[index].FirstTime,
                                LastTime: Find_Dr_Cubit.FindDrList[index].LastTime,
                                Phone: Find_Dr_Cubit.FindDrList[index].Phone,
                                rate: Find_Dr_Cubit.FindDrList[index].rate,
                                FavDr:Find_Dr_Cubit.FindDrList[index].FavDr,

                              ),
                            )
                          );
                        }),
                  ),
                ],
              ),
            );
          }),
    );
  }

  //Search for Doctor
  Widget SearchDr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 5,
        ),
        SmallTextFormWidget(
          context: context,
          controller: searchDr,
          icon: Icons.search,
          txt: "Search for Doctor",
          ontap: () {},
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.location_on_rounded,
          color: ColorManager.WitheToDarkColor(context),
          size: 30.0,
        )
      ],
    );
  }

  //Doctor Style Box
  Widget DoctorBox({
    int? index ,
    String? img,
    String? name,
    String? disc,
    String? price,
    int? rate,
    String? Location,
    String? Phone,
    String? FirstTime,
    String? LastTime,
    bool? FavDr,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: ColorManager.LGrayBasiColor.withOpacity(0.9),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularImg(img: "$img", height: 70.0, width: 70.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${name}",style: txtStyle(ColorManager.DarkColorOnly,18.0, true)),
                    SizedBox(height: 3,),
                    Text("${disc}",style: txtStyle(ColorManager.DGrayBasiColor, 12.0, false),),
                    SizedBox(height: 3,),
                    FiveStar(rate),

                                 ],
                ),
                IconButton(onPressed: (){
                  if (FavDr== true){
                    setState(() {
                      FavDr = false;
                      //اما نعمل الفير بيز اعمل fun في الكيوبت يضيف الدكتور ده لقائمة المفضلين الي تظهر للمريض
                      //واما يدخل صفحه ال find اعمل بحث حسب الاسماء الي ف المفضلين اخلي ال fav true لان ال fav هيكون false عامة
                      Find_Dr_Cubit.FindDrList[index!].FavDr = false ;
                    });
                  } else {
                    setState(() {
                      FavDr = true;
                      Find_Dr_Cubit.FindDrList[index!].FavDr = true ;
                    });

                  }


                }, icon: Icon(
                  Icons.favorite ,
                  size: 40.0,
                  color: (FavDr!)?Colors.red:ColorManager.DGrayBasiColor,
                )),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Divider(color: ColorManager.DarkColorOnly,thickness: 1,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded,color: ColorManager.DarkColorOnly,size: 25.0,),
                        SizedBox(width: 5,),
                        Text("${Location}",style: txtStyle(ColorManager.DarkColorOnly, 13.0, false),)

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.phone,color: ColorManager.DarkColorOnly,size: 25.0,),
                        SizedBox(width: 5,),
                        Text("${Phone}",style: txtStyle(ColorManager.DarkColorOnly, 13.0, false),)

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.timer,color: ColorManager.DarkColorOnly,size: 25.0,),
                        SizedBox(width: 5,),
                        Text("$FirstTime : $LastTime",style: txtStyle(ColorManager.DarkColorOnly, 13.0, false),)

                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Container(
                    //   width: 80,
                    //   height: 45,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       color: ColorManager.BlueBasiColor
                    //   ),
                    //   child: Center(
                    //     child: Icon(Icons.calendar_month,color: Colors.white, size: 25.0,),
                    //   ),
                    //   ),
                    Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ColorManager.DarkColorOnly
                      ),
                      child: Center(
                        child: Text("$price",style: txtStyle(Colors.white, 15.0, true)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.greenAccent
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.phone ,color: Colors.white,size: 25.0,
                          ),
                          onPressed: () {
                            UrlLauncher.launch("tel://${Phone}");
                          },

                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget FiveStar (int? rate ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.star ,color: (rate! >= 2)? Colors.yellow : ColorManager.DGrayBasiColor,size: 30,),
        Icon(Icons.star ,color: (rate! >= 4)? Colors.yellow : ColorManager.DGrayBasiColor,size: 30,),
        Icon(Icons.star ,color: (rate! >= 6)? Colors.yellow : ColorManager.DGrayBasiColor,size: 30,),
        Icon(Icons.star ,color: (rate! >= 8)? Colors.yellow : ColorManager.DGrayBasiColor,size: 30,),
        Icon(Icons.star ,color: (rate! == 10)? Colors.yellow : ColorManager.DGrayBasiColor,size: 30,),

      ],
    );



  }
}
