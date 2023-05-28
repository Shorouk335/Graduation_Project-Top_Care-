import 'package:cloud_firestore/cloud_firestore.dart';
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
  required Map<String?, bool?> working_day,
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
    "working_day": working_day,
    "FirstTime": FirstTime,
    "LastTime": LastTime,
  }).then((value){
    Doctor.doc(value.id).set({
      //to get this id and save in shared preferance when user sign up
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