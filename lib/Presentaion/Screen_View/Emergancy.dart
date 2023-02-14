
import 'package:flutter/material.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/TopCarve.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';

class Emergency extends StatefulWidget{
  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
              children:<Widget>[
                TopCarve(context: context ,Havetitle: true ,title: "Emergency"),
                Positioned(
                  top: 120,
                  left: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:130,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color:  ColorManager.LGrayBasiColor.withOpacity(0.5),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: (){},
                            child: Text(
                              "hospital",
                              style: txtStyle(ColorManager.DarkBasiColor, 25.0, false),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(width: 25,),
                      Container(

                        width:130,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: ColorManager.DarkBasiColor,
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: (){},
                            child: Text(
                              "contacts",
                              style: txtStyle(Colors.white, 25.0, false),
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
              ]

          ),
          SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width:500,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:  ColorManager.LGrayBasiColor.withOpacity(0.9),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 8,),
                        Text('BaBa',
                          style: txtStyle(ColorManager.DarkBasiColor, 18.0, true),),
                        SizedBox(width: 18,),
                        Icon(Icons.phone_in_talk_rounded,
                          color:ColorManager.DarkBasiColor ,),
                        SizedBox(width: 18,),
                        Text('01253698551',
                          style: txtStyle(Colors.black38, 15.0, false),),
                        SizedBox(width: 30,),
                        Container(

                          width:90,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: (){},
                              child: Text(
                                "Call now",
                                style: txtStyle(Colors.white, 17.0, false),
                              ),
                            ),
                          ),

                        ),
                        SizedBox(width: 18,),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color:  Colors.amber,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.edit,
                                  size: 35,
                                ),
                                color:Colors.white,

                              ),
                            ),

                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight: Radius.circular(20)),
                              color:  Colors.red,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.delete_forever_rounded,
                                  size: 35,
                                ),
                                color:Colors.white,

                              ),
                            ),

                          ),
                        ),


                      ],
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(

                    width:500,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:  ColorManager.LGrayBasiColor.withOpacity(0.9),
                    ),
                    child: Row(

                      children: [
                        SizedBox(width: 8,),
                        Text('Mama',
                          style: txtStyle(ColorManager.DarkBasiColor, 18.0, true),),
                        SizedBox(width: 18,),
                        Icon(Icons.phone_in_talk_rounded,
                          color:ColorManager.DarkBasiColor ,),
                        SizedBox(width: 18,),
                        Text('01211698551',
                          style: txtStyle(Colors.black38, 15.0, false),),
                        SizedBox(width: 22,),
                        Container(

                          width:90,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: (){},
                              child: Text(
                                "Call now",
                                style: txtStyle(Colors.white, 17.0, false),
                              ),
                            ),
                          ),

                        ),
                        SizedBox(width: 18,),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color:  Colors.amber,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.edit,
                                  size: 35,
                                ),
                                color:Colors.white,

                              ),
                            ),

                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight: Radius.circular(20)),
                              color:  Colors.red,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.delete_forever_rounded,
                                  size: 35,
                                ),
                                color:Colors.white,

                              ),
                            ),

                          ),
                        ),


                      ],
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(

                    width:500,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:  ColorManager.LGrayBasiColor.withOpacity(0.9),
                    ),
                    child: Row(

                      children: [
                        SizedBox(width: 8,),
                        Text('ahmed',
                          style: txtStyle(ColorManager.DarkBasiColor, 18.0, true),),
                        SizedBox(width: 18,),
                        Icon(Icons.phone_in_talk_rounded,
                          color:ColorManager.DarkBasiColor ,),
                        SizedBox(width: 18,),
                        Text('01250098551',
                          style: txtStyle(Colors.black38, 15.0, false),),
                        SizedBox(width: 20,),
                        Container(

                          width:90,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: (){},
                              child: Text(
                                "Call now",
                                style: txtStyle(Colors.white, 17.0, false),
                              ),
                            ),
                          ),

                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color:  Colors.amber,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.edit,
                                  size: 35,
                                ),
                                color:Colors.white,

                              ),
                            ),

                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight: Radius.circular(20)),
                              color:  Colors.red,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.delete_forever_rounded,
                                  size: 35,
                                ),
                                color:Colors.white,

                              ),
                            ),

                          ),
                        ),


                      ],
                    ),


                  ),
                ),

              ],
            ),
          )


        ],
      ),
    );
  }
}
