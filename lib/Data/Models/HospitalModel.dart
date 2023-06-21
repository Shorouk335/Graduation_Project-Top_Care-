import 'dart:io';

class HospitalModel {
  File? img;
  String? img1;
  String? name;
  String? Loc;
  String? phone;
  HospitalModel(
      {required this.phone,
      required this.name,
      this.img,
      required this.Loc,
      this.img1});
}
