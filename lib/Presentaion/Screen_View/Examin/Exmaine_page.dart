import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:top_care_gp/Business_Logic/Cubit/Scan_Xray_Cubit.dart';
import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Submit_Button.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
import 'package:http/http.dart' as http;

import '../../Shared_Components/Awesom_Dialog.dart';

//First page of x ray scan

var message;
var messag;

class ExmainePage extends StatefulWidget {
  @override
  // photo user select
  XFile? file;
  @override
  State<ExmainePage> createState() => _ExmainePageState();
}

class _ExmainePageState extends State<ExmainePage> {
  // String? selectedImagePath = '';
  // img picker
  final picker = ImagePicker();
  bool? camera = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Scan_Xray_Cubit(),
      child: BlocConsumer<Scan_Xray_Cubit, Scan_Xray_States>(
        listener: (context, state) {},
        builder: (context, state) {
          Scan_Xray_Cubit cubit = Scan_Xray_Cubit.get(context);
          // to show dialog of icon gallary & camera
          //حفظ الصوره ف الكيوبت هنا
          Future ShowSelectImage() {
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    height: 150,
                    color: ColorManager.WitheToDarkColor(context),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            'Select Image From ?',
                            style: txtStyle(ColorManager.DarkBasiColor(context),
                                18.0, true),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //to upload from gallary
                              GestureDetector(
                                onTap: () async {
                                  cubit.Upload_Img(
                                      await selectImageFromGallery());
                                  if (Scan_Xray_Cubit
                                          .scan_xray_Img_model?.Img_Xray !=
                                      null) {
                                    Navigator.pop(context);
                                  } else {
                                    //to show massage if not select photo
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("No Image Selected !",
                                          style: txtStyle(
                                              ColorManager.WitheToDarkColor(
                                                  context),
                                              15.0,
                                              false)),
                                      backgroundColor:
                                          ColorManager.DarkBasiColor(context),
                                    ));
                                  }
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/gallery.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Gallery'),
                                  ],
                                ),
                              ),
                              // to upload from camera
                              GestureDetector(
                                onTap: () async {
                                  cubit.Upload_Img(
                                      await selectImageFromCamera());
                                  if (Scan_Xray_Cubit
                                          .scan_xray_Img_model?.Img_Xray !=
                                      null) {
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("No Image Captured !"),
                                    ));
                                  }
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/camera.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Camera'),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          // حفظت داتا ال ML  هنا في الكيوبت
          Future ScanButton() async {
            if (Scan_Xray_Cubit.scan_xray_Img_model?.Img_Xray != null) {
              print("start");
              final request = http.MultipartRequest("POST",
                  Uri.parse("https://e2f5-41-232-238-211.ngrok-free.app"));
              print(request);
              print("finish");
              final header = {
                "Content-type": "multipart/form-data",
                "Accept": "application/json"
              };
              await Image.file(File(widget.file!.path));
              request.files.add(http.MultipartFile(
                  "myfile",
                  widget.file!.readAsBytes().asStream(),
                  File(widget.file!.path).lengthSync(),
                  filename: widget.file!.path.split("/").last));
              request.headers.addAll(header);
              final response = await request.send();
              http.Response res = await http.Response.fromStream(response);
              final resJson = jsonDecode(res.body);
              cubit.Upload_Data_From_Ml(resJson['class'], resJson['score']);
              message = resJson['class'];
              messag = resJson['score'];
              print(message);
              print(messag);
              if (camera != true &&
                  resJson['class'] != null &&
                  resJson['score'] != null) {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.ResultMlScreen);
              } else {
                ShowDialogInfoSetting(context,
                    txt: "Scan Can't be done \n\nTry another image", n: 22.0);

              }
            } else {
              ShowDialogInfoSetting(context,
                  txt: "No Image Selected !", n: 22.0);

            }
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorManager.DarkBasiColor(context),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteGenerator.HomeRoute);
                    cubit.Clear_Img();
                  }),
              //photo of patient
              // actions: [
              //   CircleAvatar(
              //     radius: 30,
              //     backgroundImage:AssetImage("assets/images/drphoto.png"),
              //     ),
              // ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                // to show img then chest photo that user select
                Scan_Xray_Cubit.scan_xray_Img_model?.Img_Xray == null
                    ? Image.asset('assets/images/examin.png')
                    : Image.file(
                        File(
                          Scan_Xray_Cubit.scan_xray_Img_model!.Img_Xray,
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    submitButton('Upload', () => ShowSelectImage(), 150, 40),
                    submitButton('Scan', () => ScanButton(), 150, 40),
                  ],
                ),
                Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }

  selectImageFromGallery() async {
    widget.file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (widget.file != null) {
      setState(() {
        camera = false;
      });
      return widget.file!.path;
    } else {
      return null;
    }
  }

  selectImageFromCamera() async {
    widget.file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (widget.file != null) {
      setState(() {
        camera = true;
      });
      return widget.file!.path;
    } else {
      return null;
    }
  }
}
