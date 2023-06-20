import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class FindDoctorHome extends StatefulWidget {
  @override
  State<FindDoctorHome> createState() => _FindDoctorHomeState();
}

class _FindDoctorHomeState extends State<FindDoctorHome> {
  TextEditingController searchDr = TextEditingController();
  Color FavDrColor = ColorManager.DGrayBasiColor;
  CollectionReference DrCollection = FirebaseFirestore.instance.collection("Doctor");
  bool? search = false;
  //داتا الدكتور الي هيبحث عنه
  Map dr_info_search = {};
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Find_Dr_Cubit(),
      child: BlocConsumer<Find_Dr_Cubit, Find_Dr_State>(
          listener: (context, states) {},
          builder: (context, states) {
            return Scaffold(
              body: StreamBuilder(
                  stream: DrCollection.snapshots(),
                  builder: (context, snapshot) {
                    return  SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(children: [
                          Stack(
                            children: [
                              TopCarve(
                                  Havetitle: false,
                                  context: context,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SmallTextFormWidget(
                                        context: context,
                                        controller: searchDr,
                                        txt: "Search for Doctor",
                                        ontap1:(){
                                          // هيدور في الكيوبت داخل الليست علي اسم الدكتور وبعدين هيحفظ البيانات في الماب الي هنا
                                          Find_Dr_Cubit.List_Of_Dr_From_FireBase.forEach((map){
                                            if (map.containsKey("username")) {
                                              if (map["username"] == searchDr.text) {
                                                setState(() {
                                                  dr_info_search= {
                                                    "username": map["username"],
                                                    "img": "assets/images/drphoto.png",
                                                     "LastTime": map["FirstTime"],
                                                    "FirstTime":map["LastTime"],
                                                    "location": map["location"],
                                                    "FavDr": false,
                                                    "price": map["price"],
                                                    "phone":map["phone"] ,
                                                    "specialization": map["specialization"],
                                                    "rate": 8.5,
                                                    "Working_Day" : map["Working_Day"]
                                                  };
                                                  //عشان يظهر جزء الدكتور الي هيدور عليه بس
                                                 search = true ;
                                                });
                                              }
                                            }
                                          });
                                        },
                                        ontap2: (){
                                          setState(() {
                                            // يمسح الماب
                                            searchDr.clear() ;
                                            // يرجع جزء الدكاترة من الفير
                                            search = false;
                                          });
                                        }
                                       ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        onPressed: (){
                                          Navigator.pushReplacementNamed(context, RouteGenerator.MapScreen);
                                        },
                                        icon: Icon(
                                          Icons.location_on_rounded,
                                          color:
                                              ColorManager.WitheToDarkColor(context),
                                          size: 30.0,
                                        ),
                                      )
                                    ],
                                  )),
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
                          (!snapshot.hasData)
                              ? Expanded(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorManager.DarkBasiColor(context),
                                    ),
                                  ),
                                )
                              : (search!)?
                             Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                        onTap: () {
                          //هخزن الداتا في المودل الي هيظهر في البابلك من خلال الماب الي معايا
                        Find_Dr_Cubit().Get_Dr_Profile_Fun(
                          img: "assets/images/drphoto.png",
                          name: dr_info_search["username"],
                          Specialization : dr_info_search["specialization"],
                          price:  dr_info_search["price"],
                          Location: dr_info_search["location"],
                          FirstTime: dr_info_search["FirstTime"],
                          LastTime: dr_info_search["LastTime"],
                          Phone: dr_info_search["phone"],
                          rate: 7,
                          FavDr: false,
                          Working_Day:  dr_info_search["Working_Day"]
                        );
                        Navigator.pushReplacementNamed(
                        context,
                        RouteGenerator
                            .PublicProfileScreen);
                        },
                          //هعرض الداتا من الماب الي فيها بينات الدكتور الي عايز تسرش عليه
                        child: DoctorBox(
                        img: "assets/images/drphoto.png",
                        name: dr_info_search["username"],
                        disc : dr_info_search["specialization"],
                        price:  dr_info_search["price"],
                        Location: dr_info_search["location"],
                        FirstTime: dr_info_search["FirstTime"],
                        LastTime: dr_info_search["LastTime"],
                        Phone: dr_info_search["phone"],
                        rate: 7,
                        FavDr: false,
                        ),
                        ))
                              :
                               Container(
                                    height: MediaQuery.of(context).size.height - 150,
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.docs
                                            .length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          //هودي بيانات الدكتور للمودل من الفير حسب الindex
                                          Find_Dr_Cubit().Add_Dr_Data_From_FB_To_List(
                                            img: "assets/images/drphoto.png",
                                            username: snapshot.data!.docs[index]
                                            ["username"],
                                            specialization: snapshot.data!.docs[index]
                                            ["specialization"],
                                            price: snapshot.data!.docs[index]
                                            ["price"],
                                            location: snapshot.data!.docs[index]
                                            ["location"],
                                            FirstTime: snapshot.data!
                                                .docs[index]["FirstTime"],
                                            LastTime: snapshot.data!.docs[index]
                                            ["LastTime"],
                                            phone: snapshot.data!.docs[index]
                                            ["phone"],
                                            rate: 7,
                                            FavDr: false,
                                            Working_Day: snapshot.data!.docs[index]
                                            ["working_day"],
                                          );
                                          return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  //اعرض بيانات الدكاتره الي في المودل
                                                  Find_Dr_Cubit().Get_Dr_Profile_Fun(
                                                    img: "assets/images/drphoto.png",
                                                    name: snapshot.data!.docs[index]
                                                        ["username"],
                                                    Specialization: snapshot.data!.docs[index]
                                                        ["specialization"],
                                                    price: snapshot.data!.docs[index]
                                                        ["price"],
                                                    Location: snapshot.data!
                                                        .docs[index]["location"],
                                                    FirstTime: snapshot.data!
                                                        .docs[index]["FirstTime"],
                                                    LastTime: snapshot.data!
                                                        .docs[index]["LastTime"],
                                                    Phone: snapshot.data!.docs[index]
                                                        ["phone"],
                                                    rate: 8,
                                                    FavDr: false,
                                                    Working_Day: snapshot.data!.docs[index]
                                                    ["working_day"],
                                                  );
                                                  Navigator.pushReplacementNamed(
                                                      context,
                                                      RouteGenerator
                                                          .PublicProfileScreen);
                                                },
                                                child: DoctorBox(
                                                  img: "assets/images/drphoto.png",
                                                  name: snapshot.data!.docs[index]
                                                      ["username"],
                                                  disc: snapshot.data!.docs[index]
                                                      ["specialization"],
                                                  price: snapshot.data!.docs[index]
                                                      ["price"],
                                                  Location: snapshot.data!.docs[index]
                                                      ["location"],
                                                  FirstTime: snapshot.data!
                                                      .docs[index]["FirstTime"],
                                                  LastTime: snapshot.data!.docs[index]
                                                      ["LastTime"],
                                                  Phone: snapshot.data!.docs[index]
                                                      ["phone"],
                                                  rate: 8,
                                                  FavDr: false,
                                                ),
                                              ));
                                        }),

                              ),
                        ]),
                      ),
                    );
                  }),
            );
          }),
    );
  }

  //Doctor Style Box
  Widget DoctorBox({
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
                    Text("${name}",
                        style:
                            txtStyle(ColorManager.DarkColorOnly, 18.0, true)),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${disc}",
                      style: txtStyle(ColorManager.DGrayBasiColor, 12.0, false),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    FiveStar(rate),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      if (FavDr == true) {
                        setState(() {
                          FavDr = false;
                          //اما نعمل الفير بيز اعمل fun في الكيوبت يضيف الدكتور ده لقائمة المفضلين الي تظهر للمريض
                          //واما يدخل صفحه ال find اعمل بحث حسب الاسماء الي ف المفضلين اخلي ال fav true لان ال fav هيكون false عامة
                          // Find_Dr_Cubit.FindDrList[index!].FavDr = false ;
                        });
                      } else {
                        setState(() {
                          FavDr = true;
                          // Find_Dr_Cubit.FindDrList[index!].FavDr = true ;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 40.0,
                      color:
                          (FavDr!) ? Colors.red : ColorManager.DGrayBasiColor,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: ColorManager.DarkColorOnly,
              thickness: 1,
            ),
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
                        Icon(
                          Icons.location_on_rounded,
                          color: ColorManager.DarkColorOnly,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${Location}",
                          style:
                              txtStyle(ColorManager.DarkColorOnly, 13.0, false),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: ColorManager.DarkColorOnly,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${Phone}",
                          style:
                              txtStyle(ColorManager.DarkColorOnly, 13.0, false),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: ColorManager.DarkColorOnly,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$FirstTime : $LastTime",
                          style:
                              txtStyle(ColorManager.DarkColorOnly, 13.0, false),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ColorManager.DarkColorOnly),
                      child: Center(
                        child: Text("$price",
                            style: txtStyle(Colors.white, 15.0, true)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.greenAccent),
                      child: Center(
                          child: IconButton(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://${Phone}");
                        },
                      )),
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

  Widget FiveStar(int? rate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.star,
          color: (rate! >= 2) ? Colors.yellow : ColorManager.DGrayBasiColor,
          size: 30,
        ),
        Icon(
          Icons.star,
          color: (rate >= 4) ? Colors.yellow : ColorManager.DGrayBasiColor,
          size: 30,
        ),
        Icon(
          Icons.star,
          color: (rate >= 6) ? Colors.yellow : ColorManager.DGrayBasiColor,
          size: 30,
        ),
        Icon(
          Icons.star,
          color: (rate >= 8) ? Colors.yellow : ColorManager.DGrayBasiColor,
          size: 30,
        ),
        Icon(
          Icons.star,
          color: (rate == 10) ? Colors.yellow : ColorManager.DGrayBasiColor,
          size: 30,
        ),
      ],
    );
  }
}
