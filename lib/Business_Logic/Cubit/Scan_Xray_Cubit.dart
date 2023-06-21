import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/CubitModel/Notification_Model.dart';
import 'package:top_care_gp/Business_Logic/CubitModel/Scan_Xray_Model.dart';
import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';

//Flow of Scan $ Notification
class Scan_Xray_Cubit extends Cubit<Scan_Xray_States> {
  Scan_Xray_Cubit() : super(Initial_Scan_Xray_States());

  static Scan_Xray_Cubit get(context) => BlocProvider.of(context);

  //Objects of models of data
  //object of img
  static Scan_Xray_Img_Model? scan_xray_Img_model;
  // object of data
  static Scan_Result_From_ML_Model? scan_result_from_ml_model;

  //Function To Upload img from user and save in model
  void Upload_Img(String Img_Xray) {
    scan_xray_Img_model = Scan_Xray_Img_Model(
      Img_Xray: Img_Xray,
    );

    emit(Upload_Img_From_User_state());
  }

  //Function To clear img in model
  void Clear_Img() {
    scan_xray_Img_model?.Img_Xray = null;
    emit(Clear_Img_From_User_state());
  }

  //Function to upload data from ml and save in model
  void Upload_Data_From_Ml(dynamic Result_Text, dynamic Result_num) {
    scan_result_from_ml_model = Scan_Result_From_ML_Model(
        Result_Text: Result_Text, Result_num: Result_num);
    emit(Upload_Data_From_Ml_state());
  }

  //Function to clear data model
  void Clear_Data_From_Ml() {
    scan_result_from_ml_model!.Result_Text = null;
    scan_result_from_ml_model!.Result_num = 0.0;
    emit(Clear_Data_From_Ml_state());
  }

  //Notification
  static List<Notification_Model> Notification_List = [
    Notification_Model(
        name: "Mohammed Ali",
        Time: "San 5:00 pm",
        IconTxt: "View Result ",
        img: "assets/images/man.png"),
    Notification_Model(
        name: "Ahmed Ali",
        Time: "San 7:00 pm",
        IconTxt: "Wait Result ",
        img: "assets/images/man.png"),
    Notification_Model(
        name: "Mohammed Ali",
        Time: "San 5:00 pm",
        IconTxt: "View Scan   ",
        img: "assets/images/man.png"),
    Notification_Model(
        name: "Ahmed Ali",
        Time: "San 7:00 pm",
        IconTxt: "Reject Order",
        img: "assets/images/man.png"),
  ];

  static Color NotificationColor = Colors.transparent;

  //Function To Generate Common sign up Data model
  void Add_Notification_To_List({
    String? name,
    String? img,
    String? Time,
    String? IconTxt,
  }) {
    Notification_List.add(
        Notification_Model(name: name, Time: Time, IconTxt: IconTxt, img: img));
    NotificationColor = Colors.red;
    emit(Add_Notification_State());
  }

  void NoNotificationColor() {
    NotificationColor = Colors.transparent;
    emit(No_Notification_State());
  }
}
