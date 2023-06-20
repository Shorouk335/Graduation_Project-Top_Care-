import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Shared_Preferences/Shared_Preferences.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Circular_Img.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';


class DocProfile extends StatefulWidget {
  @override
  State<DocProfile> createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  DocumentReference DrDocument = FirebaseFirestore.instance.collection(DataCashHelper.GetData(key: "Type").toString()).doc(DataCashHelper.GetData(key: "id"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder(
          stream: DrDocument.snapshots(),
          builder: (context, snapshot){
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                //profile img
                Container(
                  child: Column(
                    children: [
                      CircularImg(img: "assets/images/drphoto.png",height: 130.0,width: 130.0),
                      SizedBox(height: 10,),
                      Text(
                        "${snapshot.data?["username"]}",
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
                          child: Text('${snapshot.data?["price"]}',
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
                                '2k',
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
                                '5Y',
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
                                '8.5',
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
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20,left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildBox(tit: "Phone",disc:snapshot.data?["phone"]),
                      SizedBox(
                        height: 10,
                      ),
                      buildBox(tit: "Location",disc: snapshot.data?["location"]),
                      SizedBox(
                        height: 10,
                      ),
                      buildBox(tit: "Specialization",disc: snapshot.data?["specialization"]),
                      SizedBox(
                        height: 10,
                      ),
                      buildBox(tit: "Working Day",disc:snapshot.data?["working_day"]),
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
                              child: Text('${snapshot.data?["FirstTime"]}',
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
                              child: Text('${snapshot.data?["LastTime"]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ],
            );
          }

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
              "${disc}",
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
      ),
      IconButton(
        onPressed: () async{
          await DataCashHelper.DeleteData(key: "id");
          await DataCashHelper.DeleteData(key: "Type");
          await SignOut(context);        },
        icon: Icon(Icons.logout),
        color: ColorManager.DarkBasiColor(context),
      )
    ],
  );
}


// class DocProfile extends StatefulWidget {
//   @override
//   State<DocProfile> createState() => _DocProfileState();
// }
//
// class _DocProfileState extends State<DocProfile> {
//   DocumentReference DrDocument = FirebaseFirestore.instance.collection("Doctor").doc(DataCashHelper.GetData(key: "id"));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: StreamBuilder(
//         stream: DrDocument.snapshots(),
//           builder: (context, snapshot){
//           return ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               //profile img
//               Container(
//                 child: Column(
//                   children: [
//                     CircularImg(img: "assets/images/drphoto.png",height: 130.0,width: 130.0),
//                     SizedBox(height: 10,),
//                     Text(
//                       "${snapshot.data?["username"]}",
//                       style: txtStyle(ColorManager.BlueBasiColor, 25.0, true),
//                     ),
//                     SizedBox(height: 10,),
//                     Container(
//                       height: 50,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: ColorManager.BlueBasiColor,
//                       ),
//                       child: Center(
//                         child: Text('${snapshot.data?["price"]}',
//                           style: txtStyle(Colors.white, 15.0, true),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Container(
//                       width: MediaQuery.of(context).size.width*0.9,
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     // الجزء بتاع الايكونات ف البروفايل فوق
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         //patient
//                         Column(
//                           children: [
//                             Icon(
//                               Icons.people_alt,
//                               color: ColorManager.BlueBasiColor,
//                               size: 20,
//                             ),
//                             Text(
//                               'Patient',
//                               style: TextStyle(color: ColorManager.BlueBasiColor, fontSize: 17),
//                             ),
//                             Text(
//                               '2k',
//                               style: TextStyle(
//                                   color: ColorManager.DarkBasiColor(context),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Icon(
//                               Icons.work,
//                               color: ColorManager.BlueBasiColor,
//                               size: 20,
//                             ),
//                             Text(
//                               'Experience',
//                               style: TextStyle(  color: ColorManager.BlueBasiColor,
//                                   fontSize: 17),
//                             ),
//                             Text(
//                               '5Y',
//                               style: TextStyle(
//                                   color: ColorManager.DarkBasiColor(context),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Icon(
//                               Icons.star_half,
//                               color: ColorManager.BlueBasiColor,
//                               size: 20,
//                             ),
//                             Text(
//                               'Rating',
//                               style: TextStyle(color: ColorManager.BlueBasiColor, fontSize: 17),
//                             ),
//                             Text(
//                               '8.5',
//                               style: TextStyle(
//                                   color: ColorManager.DarkBasiColor(context),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width*0.9,
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top:20,left: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     buildBox(tit: "Specialization",disc: snapshot.data?["specialization"]),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     buildBox(tit: "Phone",disc:snapshot.data?["phone"]),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     buildBox(tit: "Location",disc: snapshot.data?["location"]),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     buildBox(tit: "Working Day",disc:snapshot.data?["working_day"]),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       ' Time',
//                       style: TextStyle(
//                           color: ColorManager.BlueBasiColor,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: ColorManager.BlueBasiColor,
//                           ),
//                           child: Center(
//                             child: Text('${snapshot.data?["FirstTime"]}',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 )),
//                           ),
//                         ),
//                         Icon(Icons.arrow_forward),
//                         Container(
//                           height: 50,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: ColorManager.BlueBasiColor,
//                           ),
//                           child: Center(
//                             child: Text('${snapshot.data?["LastTime"]}',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//           }
//
//       ),
//     );
//   }
//
//   //الجزء بتاع about
//   Widget buildBox({String? tit , String? disc}) => Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "${tit}",
//               style: txtStyle(ColorManager.BlueBasiColor, 18.0, true),
//             ),
//             SizedBox(
//               height: 6,
//             ),
//             Container(
//               height: 50,
//               width: MediaQuery.of(context).size.width*0.9,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 color:ColorManager.LGrayBasiColor,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   "${disc}",
//                   style: txtStyle(Colors.black, 15.0, false),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//
// }
//
// //جزء ال appbar
// AppBar buildAppBar(BuildContext context) {
//   return AppBar(
//     leading: IconButton(
//         icon: Icon(Icons.arrow_back_ios_new,
//             color: ColorManager.DarkBasiColor(context)),
//         onPressed: () {
//           Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
//         }),
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     actions: [
//       IconButton(
//         onPressed: () {
//           Navigator.pushReplacementNamed(context, RouteGenerator.DocSetting);
//         },
//         icon: Icon(Icons.settings),
//         color: ColorManager.DarkBasiColor(context),
//       ),
//       IconButton(
//         onPressed: () async{
//           await DataCashHelper.DeleteData(key: "id");
//           await DataCashHelper.DeleteData(key: "Type");
//           await SignOut(context);        },
//         icon: Icon(Icons.logout),
//         color: ColorManager.DarkBasiColor(context),
//       )
//     ],
//   );
// }

