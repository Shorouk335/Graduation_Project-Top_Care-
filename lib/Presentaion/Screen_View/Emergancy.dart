import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/ContactModel.dart';
import 'package:top_care_gp/Data/Models/HospitalModel.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Text_Form_Widget.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Top_Carve.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Upload_Image.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher ;

class Emergency extends StatefulWidget {
  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {


  //controller
  var nameControllerHospital = TextEditingController();
  var phoneControllerHospital = TextEditingController();
  var locControllerHospital = TextEditingController();

  var nameControllerContacts = TextEditingController();
  var phoneControllerContacts = TextEditingController();

  // TO change between hospital and contacts
  bool Hospital = true;
  void ChangeType(bool T) {
    setState(() {
      Hospital = T;
    });
  }

  //list of contacts and fun to add
  void AddToContacts({String? n, String? p}) {
    setState(() {
      Contacts.add(ContactModel(name: n, phone: p));
    });
  }

  List<ContactModel> Contacts = [
    ContactModel(name: "Baba", phone: "01024567735")
  ];

  //list of hospital and fun to add
  void AddToHospital({File? im, String? n, String? p, String? l}) {
    setState(() {
      Hospitals.add(HospitalModel(name: n, phone: p, Loc: l, img: im));
    });
  }

  List<HospitalModel> Hospitals = [];
  @override
  Widget build(BuildContext context) {
    //Colors of BOTTOM
    Color NonActiveColor = ColorManager.LGrayBasiColor.withOpacity(0.5);
    Color ActiveColor = ColorManager.DarkBasiColor(context);
    Color ActiveText = ColorManager.WitheToDarkColor(context);
    Color NonActiveText = ColorManager.DarkBasiColor(context);

    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    //HospitaL page
    Widget HospitalPage() {
      return ListView.builder(
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
                        Container(
                          width: Width * 0.4,
                          height: Height * 0.18,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: (Hospitals[index].img != null)
                              ? Image.file(
                                  Hospitals[index].img!,
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Icon(
                                    Icons.local_hospital_outlined,
                                    size: 80,
                                    color:ColorManager.WitheToDarkColor(context),
                                  ),
                                ),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${Hospitals[index].name}',
                              style: txtStyle(
                                  ColorManager.DarkColorOnly, 20.0, true),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_in_talk_rounded,
                                  color: ColorManager.DarkColorOnly,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${Hospitals[index].phone}',
                                  style: txtStyle(Colors.black38, 15.0, false),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: ColorManager.DarkColorOnly,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${Hospitals[index].Loc}',
                                  style: txtStyle(Colors.black38, 15.0, false),
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
                                  onPressed: () {
                                    UrlLauncher.launch("tel://${Hospitals[index].phone}");
                                  },
                                  child: Text(
                                    "Call now",
                                    style: txtStyle(Colors.white, 17.0, false),
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
      );
    }

    //Contacts page
    Widget ContactsPage() {
      return ListView.builder(
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
                        style: txtStyle(ColorManager.DarkColorOnly, 18.0, true),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Icon(
                        Icons.phone_in_talk_rounded,
                        color: ColorManager.DarkColorOnly,
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
                      onPressed: () {
                        UrlLauncher.launch("tel://${Contacts[index].phone}");
                      },
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
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: Stack(children: <Widget>[
          TopCarve(context: context, Havetitle: true, title: "Emergency"),
          Container(
            child: Positioned(
              top: 120,
              left: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Hospital ? ActiveColor : NonActiveColor,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          ChangeType(true);
                        },
                        child: Text(
                          "hospital",
                          style: txtStyle(Hospital ? ActiveText : NonActiveText,
                              25.0, false),
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
                      color: Hospital ? NonActiveColor : ActiveColor,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          ChangeType(false);
                        },
                        child: Text(
                          "contacts",
                          style: txtStyle(Hospital ? NonActiveText : ActiveText,
                              25.0, false),
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
                color: ColorManager.WitheToDarkColor(context),
              )),
        ]),
      ),
      body: Hospital ? HospitalPage() : ContactsPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Hospital
              ? await DialogEmergencyHospital(context)
              : await DialogEmergencyContact(context);
        },
        backgroundColor: ColorManager.DarkBasiColor(context),
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  //Diallllllllllllllog
  Future<dynamic> DialogEmergencyHospital(BuildContext context) {
    File? Img;
    return AwesomeDialog(
      context: context,
      dialogBackgroundColor: ColorManager.WitheToDarkColor(context),
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
                  child: InkWell(
                    onTap: () async {
                      Img = await UploadImageFromGallery();
                    },
                    child: Icon(
                      Icons.photo_camera_back,
                      size: 100,
                      color: ColorManager.WitheToDarkColor(context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Name",
                style: txtStyle(ColorManager.DarkBasiColor(context), 25.0, true),
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
                  child:
                      TextFormWithoutIcon(controller: nameControllerHospital)),
              SizedBox(
                height: 20,
              ),
              Text(
                "Phone",
                style: txtStyle(ColorManager.DarkBasiColor(context), 25.0, true),
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
                  child:
                      TextFormWithoutIcon(controller: phoneControllerHospital)),
              SizedBox(
                height: 20,
              ),
              Text(
                "Location",
                style: txtStyle(ColorManager.DarkBasiColor(context), 25.0, true),
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
                  child:
                      TextFormWithoutIcon(controller: locControllerHospital)),
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
                      AddToHospital(
                          im: Img,
                          n: nameControllerHospital.text,
                          l: locControllerHospital.text,
                          p: phoneControllerHospital.text);
                      nameControllerHospital.clear();
                      phoneControllerHospital.clear();
                      locControllerHospital.clear();
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
    return AwesomeDialog(
      context: context,
      dialogBackgroundColor: ColorManager.WitheToDarkColor(context),
      dialogType: DialogType.noHeader,
      dialogBorderRadius: BorderRadius.circular(20.0),
      // the content of dialog
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          height: 300,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: txtStyle(ColorManager.DarkBasiColor(context), 25.0, true),
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
                  child:
                      TextFormWithoutIcon(controller: nameControllerContacts)),
              SizedBox(
                height: 20,
              ),
              Text(
                "Phone",
                style: txtStyle(ColorManager.DarkBasiColor(context), 25.0, true),
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
                  child:
                      TextFormWithoutIcon(controller: phoneControllerContacts)),
              Spacer(),
              Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.BlueBasiColor),
                  child: TextButton(
                    onPressed: () {
                      AddToContacts(
                          n: nameControllerContacts.text,
                          p: phoneControllerContacts.text);
                      nameControllerContacts.clear();
                      phoneControllerContacts.clear();
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

// fun of edit and delete
void doNothing(BuildContext context) {}
