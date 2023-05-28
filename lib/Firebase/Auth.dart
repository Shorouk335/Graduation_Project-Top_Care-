import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Awesom_Dialog.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';

// اوبجككت من الحساب الي هيدخل بيه
UserCredential? userCredential;

// للحصول علي معلومات المستخدم الحالي
Future getUserData() async {
  return await FirebaseAuth.instance.currentUser;
}
//get user id ===========> not work yet
 getUserId() async {
  return await FirebaseAuth.instance.currentUser?.uid.toString();
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
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);

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

    // if (userCredential!.user!.emailVerified == false) {
    //   User? user = FirebaseAuth.instance.currentUser;
    //   await user!.sendEmailVerification();
    // }

    // في حاله حدوث هذا الخطا
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ShowDialogSign(context,
          txt: "Weak Password", img: AssetManager.AwesomError, type: "warning");
    } else if (e.code == 'email-already-in-use') {
      ShowDialogSign(context,
          txt: "Email already in use", img: AssetManager.AwesomError, type: "warning");
    }
    // لو خطا اخر
  } catch (e) {
    print(e);
  }
}

// التسجيل باكونت جوجل

// Future SignInWithGoogle(BuildContext context) async {
//   //عشان اجيب حساب جوجل
//   final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
//
//   //بعمل auth عشان اوصل لتفاصيل ال user
//   final GoogleSignInAuthentication? googleAuth =
//       await googleuser?.authentication;
//
//   //create credential
//   final OAuthCredential googleCred = await GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
//
//   userCredential = await FirebaseAuth.instance
//       .signInWithCredential(googleCred);
//        Navigator.pushReplacementNamed(context, HomeScreen);
// }

//التسجيل بالفيس
// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
//       loginResult.accessToken!.token);
//
//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }
