import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/ContactModel.dart';
import 'package:top_care_gp/Data/Models/HospitalModel.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/TopCarve.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Emergency extends StatefulWidget {
  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  String Type = "H";

  void ChangeType(String T) {
    setState(() {
      Type = T;
    });
  }

  void AddToContacts({String? n, String? p}) {
    setState(() {
      Contacts.add(ContactModel(name: n, phone: p));
    });
  }

  List<ContactModel> Contacts = [
    ContactModel(name: "BaBa", phone: "0187784587"),
    ContactModel(name: "MaMa", phone: "0187784587"),
    ContactModel(name: "Bro", phone: "0187784587"),
  ];

  void AddToHospital({String? im, String? n, String? p, String? l}) {
    setState(() {
      Hospitals.add(HospitalModel(name: n, phone: p, Loc: l, img: "NO"));
    });
  }

  List<HospitalModel> Hospitals = [
    HospitalModel(
        phone: "12489",
        name: "New Cairo",
        Loc: "31st Cairo",
        img: AssetManager.Hospital),
    HospitalModel(
        phone: "12489", name: "New Cairo", Loc: "31st Cairo", img: "No"),
  ];

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: Stack(children: <Widget>[
          TopCarve(context: context, Havetitle: true, title: "Emergency"),
          Container(
            child: Positioned(
              top: 120,
              left: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: ColorManager.LGrayBasiColor.withOpacity(0.5),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          ChangeType("H");
                        },
                        child: Text(
                          "hospital",
                          style:
                              txtStyle(ColorManager.DarkBasiColor, 25.0, false),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: ColorManager.DarkBasiColor,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          ChangeType("C");
                        },
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
          ),
          Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.HomeRoute);
                },
                icon: Icon(Icons.arrow_back_ios_sharp),
                color: ColorManager.DarkBasiColor,
              )),
        ]),
      ),
      body: (Type == "H")
          ? ListView.builder(
              itemCount: Hospitals.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    height: Height * 0.2,
                    width: Width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.LGrayBasiColor.withOpacity(0.9),
                    ),
                    child: Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),
                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),
                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),
                        // All actions are defined in the children parameter.
                        children: const [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 2,
                            onPressed: doNothing,
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),
                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: Container(
                        height: Height * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: Width * 0.4,
                                  height: Height * 0.18,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: (Hospitals[index].img == "No")
                                      ? Center(
                                          child: Icon(
                                            Icons.local_hospital_outlined,
                                            size: 80,
                                            color: ColorManager.DarkBasiColor,
                                          ),
                                        )
                                      : Image(
                                          image: AssetImage(
                                              "${AssetManager.Hospital}"),
                                          fit: BoxFit.fill,
                                        )),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${Hospitals[index].name}',
                                    style: txtStyle(
                                        ColorManager.DarkBasiColor, 20.0, true),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_in_talk_rounded,
                                        color: ColorManager.DarkBasiColor,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${Hospitals[index].phone}',
                                        style: txtStyle(
                                            Colors.black38, 15.0, false),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: ColorManager.DarkBasiColor,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${Hospitals[index].Loc}',
                                        style: txtStyle(
                                            Colors.black38, 15.0, false),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Container(
                                    width: 90,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Call now",
                                          style: txtStyle(
                                              Colors.white, 17.0, false),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: Contacts.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    height: 80,
                    width: Width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.LGrayBasiColor.withOpacity(0.9),
                    ),
                    child: Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),
                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),
                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),
                        // All actions are defined in the children parameter.
                        children: const [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 2,
                            onPressed: doNothing,
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),
                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: Container(
                        height: 80,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${Contacts[index].name}',
                              style: txtStyle(
                                  ColorManager.DarkBasiColor, 18.0, true),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Icon(
                              Icons.phone_in_talk_rounded,
                              color: ColorManager.DarkBasiColor,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              '${Contacts[index].phone}',
                              style: txtStyle(Colors.black38, 15.0, false),
                            ),
                            Spacer(),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Call now",
                                    style: txtStyle(Colors.white, 17.0, false),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (Type == "H") {
            return await DialogEmergencyHospital(context);
          } else {
            return await DialogEmergencyContact(context);
          }
        },
        backgroundColor: ColorManager.DarkBasiColor,
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  Future<dynamic> DialogEmergencyHospital(BuildContext context) {
    String? name;
    String? phone;
    String? loc;
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      dialogBorderRadius: BorderRadius.circular(20.0),
      // the content of dialog
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          height: 600,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.LGrayBasiColor),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo_camera_back,
                      size: 100,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Name",
                style: txtStyle(ColorManager.DarkBasiColor, 25.0, true),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.LGrayBasiColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: ColorManager.DGrayBasiColor,

                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Phone",
                style: txtStyle(ColorManager.DarkBasiColor, 25.0, true),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.LGrayBasiColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: ColorManager.DGrayBasiColor,
                    onChanged: (value) {
                      phone = value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Location",
                style: txtStyle(ColorManager.DarkBasiColor, 25.0, true),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.LGrayBasiColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: ColorManager.DGrayBasiColor,
                    onChanged: (value) {
                      loc = value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.BlueBasiColor),
                  child: TextButton(
                    onPressed: () {
                      AddToHospital(im: "No", n: name, l: loc, p: phone);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: txtStyle(Colors.white, 25.0, true),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ).show();
  }

  Future<dynamic> DialogEmergencyContact(BuildContext context) {
    String? name;
    String? phone;
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      dialogBorderRadius: BorderRadius.circular(20.0),
      // the content of dialog
      body: Container(
        height: 300,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: txtStyle(ColorManager.DarkBasiColor, 25.0, true),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.LGrayBasiColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: ColorManager.DGrayBasiColor,
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Phone",
                style: txtStyle(ColorManager.DarkBasiColor, 25.0, true),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.LGrayBasiColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: ColorManager.DGrayBasiColor,
                    onChanged: (value) {
                      phone = value;
                    },
                  ),
                ),
              ),
              Spacer(),
              Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.BlueBasiColor),
                  child: TextButton(
                    onPressed: () {
                      AddToContacts(n: name, p: phone);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: txtStyle(Colors.white, 25.0, true),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ).show();
  }
}

void doNothing(BuildContext context) {}
