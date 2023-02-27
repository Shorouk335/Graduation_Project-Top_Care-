import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:top_care_gp/Firebase/Auth.dart';

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
  required String? about,
  required String? spec,
  required String? loc,
  required var price,
  required Map<String?, bool?> working_day,
  required Map<String?, String?> time,
}) async {
  await Doctor.add({
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "gender": gender,
    "about": about,
    "specialization": spec,
    "loction": loc,
    "price": price,
    "working_day": working_day,
    "time": time,
  }).then((value){
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
    "gender": gender,}).then((value)  {
      Patient.doc(value.id).set({
        "id" : value.id ,
      } , SetOptions(merge: true)
     );
  }).catchError((e) {
    print("errror on add patient ${e.toString()}");
  });
}

//