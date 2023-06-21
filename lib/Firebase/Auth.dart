import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Shared_Preferences/Shared_Preferences.dart';
import 'package:top_care_gp/Firebase/store.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Awesom_Dialog.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/String_Manager/String_Manager.dart';

// اوبجككت من الحساب الي هيدخل بيه
UserCredential? userCredential;

// للحصول علي معلومات المستخدم الحالي
Future getUserData() async {
  return await FirebaseAuth.instance.currentUser;
}

//تسجيل الخروج
Future SignOut(BuildContext context) async {
  Navigator.pushReplacementNamed(context, RouteGenerator.SplachRoute);
  return await FirebaseAuth.instance.signOut();
}

// تسجبل الدخول بحساب موجود
Future LogInWithFire(BuildContext context,
    {String? email, String? password}) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    await Doctor.where("email", isEqualTo: email).get().then((value) {
      value.docs.forEach((element) async {
        print(element["id"]);
        await DataCashHelper.PutData(key: "id", value: element["id"]);
        await DataCashHelper.PutData(key: "Type", value: element["Type"]);
      });
    });
    await Patient.where("email", isEqualTo: email).get().then((value) {
      value.docs.forEach((element) async {
        print(element["id"]);
        print(element["Type"]);
        await DataCashHelper.PutData(key: "id", value: element["id"]);
        await DataCashHelper.PutData(key: "Type", value: element["Type"]);
      });
    });

    Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      ShowDialogSign(context,
          txt: "User not found", img: AssetManager.AwesomError, type: "error");
    } else if (e.code == "wrong-password") {
      ShowDialogSign(context,
          txt: "Wrong Password", img: AssetManager.AwesomError, type: "error");
    }
  } catch (e) {}
}

// انشاء حساب باميل وباسورد
Future SignUpWithFire(BuildContext context,
    {String? email, String? password}) async {
  try {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    // في حاله حدوث هذا الخطا
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ShowDialogSign(context,
          txt: "Weak Password", img: AssetManager.AwesomError, type: "warning");
    } else if (e.code == 'email-already-in-use') {
      ShowDialogSign(context,
          txt: "Email already in use",
          img: AssetManager.AwesomError,
          type: "warning");
    }
    // لو خطا اخر
  } catch (e) {
    print(e);
  }
}
