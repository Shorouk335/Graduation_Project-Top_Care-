import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/CubitModel/FindDoctorModel.dart';
import 'package:top_care_gp/Business_Logic/States/Find_Dr_State.dart';

class Find_Dr_Cubit extends Cubit<Find_Dr_State> {
  Find_Dr_Cubit() : super(Find_Dr_Initial_state());

  static Find_Dr_Cubit get(context) => BlocProvider.of(context);


  //ليست من كل داتا الدكاتره في الفير ومن خلالها هدور علي الاسم واعرضه في البحث
  static List List_Of_Dr_From_FireBase = [];

  void Add_Dr_Data_From_FB_To_List({
    String? img,
    String? username,
    String? specialization,
    String? price,
    int? rate,
    String? location,
    String? phone,
    String? FirstTime,
    String? LastTime,
    bool? FavDr,
  }) {
    List_Of_Dr_From_FireBase.add(
        {
          "img": img,
          "username": username,
          "LastTime": LastTime,
          "FirstTime": FirstTime,
          "location": location,
          "FavDr": FavDr,
          "price": price,
          "phone": phone,
          "specialization": specialization,
          "rate": rate,
        }
    );
    emit(Search_Doctor_state());
  }

  // بينات الدكتور الي هيظهر في صفحة البابلك
  static Get_Doctor_Profile? model;

  void Get_Dr_Profile_Fun({
    String? img,
    String? name,
    String? Specialization,
    String? price,
    int? rate,
    String? Location,
    String? Phone,
    String? FirstTime,
    String? LastTime,
    bool? FavDr,
  }) {
    model = Get_Doctor_Profile(
      img: img,
      name: name,
      LastTime: LastTime,
      FirstTime: FirstTime,
      Location: Location,
      FavDr: FavDr,
      price: price,
      Phone: Phone,
      Specialization: Specialization,
      rate: rate,
    );
    emit(Get_Doctor_Data_state());
  }

}
