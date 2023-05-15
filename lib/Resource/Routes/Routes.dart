import 'package:flutter/material.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Home_Screen.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Log_in.dart';
import 'package:top_care_gp/Presentaion/Screen_View/On_Boarding.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Profile/doctor_setting.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Profile/patient_profile.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Profile/patient_setting.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Setting.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Sign_up/Dr_sign_up.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Sign_up/Patient_sign_up.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Splach.dart';
import '../../Presentaion/Screen_View/Sign_up/Common_sign_up.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Emergancy.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Profile/doctor_profile.dart';

class RouteGenerator {
  static const String SplachRoute = "/Splach";
  static const String OnBordingRoute = "OnBording";
  static const String HomeRoute = "Home";
  static const String LoginRoute = "Login";
  static const String Common_SignUpRoute = "CommonSignUp";
  static const String Dr_SignUpRoute = "DrSignUp";
  static const String Patient_SignUpRoute = "PatientSignUp";
  static const String Emergencyscreen = "Emergency";
  static const String Settingscreen = "Setting";
  static const String DoctorProfile = "DocProfile";
  static const String DocSetting = "DocSetting";
  static const String PetProfile = "PetProfile";
  static const String PetSetting = "PetSetting";


  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteGenerator.SplachRoute:
        return MaterialPageRoute(builder: (_) => Splach());
      case RouteGenerator.OnBordingRoute:
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case RouteGenerator.HomeRoute:
        return MaterialPageRoute(builder: (_) => Home());
        case RouteGenerator.LoginRoute:
          return MaterialPageRoute(builder: (_) => Log_in());
      case RouteGenerator.Common_SignUpRoute:
        return MaterialPageRoute(builder: (_) => Common_sign_up());
        case RouteGenerator.Dr_SignUpRoute:
        return MaterialPageRoute(builder: (_) => Dr_sign_up());
        case RouteGenerator.Patient_SignUpRoute:
        return MaterialPageRoute(builder: (_) => Patient_sign_up());
       case RouteGenerator.Emergencyscreen:
        return MaterialPageRoute(builder: (_) =>  Emergency());
        case RouteGenerator.Settingscreen:
        return MaterialPageRoute(builder: (_) =>  SettingPage());
       case RouteGenerator.DoctorProfile:
        return MaterialPageRoute(builder: (_) =>  DocProfile());
        case RouteGenerator.DocSetting:
        return MaterialPageRoute(builder: (_) => DoctorSetting());
      case RouteGenerator.PetProfile:
        return MaterialPageRoute(builder: (_) =>  PatientProfile());
      case RouteGenerator.DocSetting:
        return MaterialPageRoute(builder: (_) => PatientSetting());

      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }

  // static Route<dynamic> UnDefinedRoute() {
  //   return MaterialPageRoute(
  //     builder: (_) => Scaffold(
  //       body: Center(
  //         child: Text("NOT FOUND"),
  //       ),
  //     ),
  //   );
  // }
}
