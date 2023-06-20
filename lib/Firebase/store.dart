import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:top_care_gp/Data/Shared_Preferences/Shared_Preferences.dart';
//Collection of Doctor
CollectionReference Doctor = FirebaseFirestore.instance.collection("Doctor");

//Collection of Patient
CollectionReference Patient = FirebaseFirestore.instance.collection("Patient");

//add dr to firestore with his id
void AddDoctorToFireStore({
  required String? username,
  required String? email,
  required String? password,
  required String? phone,
  required String? gender,
  required String? spec,
  required String? loc,
  required var price,
  required String? working_day,
  required String? FirstTime,
  required String? LastTime,
}) async {
  await Doctor.add({
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "gender": gender,
    "specialization": spec,
    "location": loc,
    "price": price,
    "Type":"Doctor",
    "FavNumber":0,
    "working_day": working_day,
    "FirstTime": FirstTime,
    "LastTime": LastTime,
  }).then((value)async{
    await DataCashHelper.PutData(key: "id", value: value.id );
    await DataCashHelper.PutData(key: "Type", value: "Doctor" );
    Doctor.doc(value.id).set({
      "id" : value.id ,
    } , SetOptions(merge: true)
    );

  }).catchError((e) {
    print("errror on add dr ${e.toString()}");
  });
}

// add patient to firestore with his id
void AddPatienToFireStore({
  required String? username,
  required String? email,
  required String? password,
  required String? phone,
  required String? gender,
}) async {
  await Patient.add({
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "Type":"Patient",
    "FavNumber":0,
    "gender": gender,}).then((value) async{
    await DataCashHelper.PutData(key: "id", value: value.id );
    await DataCashHelper.PutData(key: "Type", value: "Patient" );

    Patient.doc(value.id).set({
        "id" : value.id ,
      } , SetOptions(merge: true)
     );
  }).catchError((e) {
    print("errror on add patient ${e.toString()}");
  });
}

