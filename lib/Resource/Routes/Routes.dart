import 'package:flutter/material.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Examin/ResultofXray/Result_From_Ml.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Examin/ResultofXray/Patient_Qestion.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Examin/Exmaine_page.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Find_Your_Doctor/FindDoctorHome.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Find_Your_Doctor/Map.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Home_Screen.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Know_About_Pneumonia/Know_About_Pneumonia.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Log_in.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Notification/Notification_Page.dart';
import 'package:top_care_gp/Presentaion/Screen_View/On_Boarding.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Pharmcy.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Profile/PublicDrProfile.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Profile/doctor_setting.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Profile/patient_setting.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Setting.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Sign_up/Dr_sign_up.dart';
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
  static const String Patient_QuestionScreen= "PatientQuestion";
  static const String Emergencyscreen = "Emergency";
  static const String Settingscreen = "Setting";
  static const String DoctorProfile = "DocProfile";
  static const String DocSetting = "DocSetting";
  static const String PetSetting = "PetSetting";
  static const String ExmainPageScreen = "ExmainPage";
  static const String ResultMlScreen = "ResultmL";
  static const String FindDoctorHScreen = "FindDrHome";
  static const String PublicProfileScreen = "PublicProfile";
  static const String NotificationScreen = "Notification_Page";
  static const String PharmacyScreen = "Pharmacy";
  static const String KnowAboutPheumoniaScreen = "KnowAboutPheumonia";
  static const String MapScreen = "MapSample";


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
        case RouteGenerator.Patient_QuestionScreen:
        return MaterialPageRoute(builder: (_) => Patient_Question());
       case RouteGenerator.Emergencyscreen:
        return MaterialPageRoute(builder: (_) =>  Emergency());
        case RouteGenerator.Settingscreen:
        return MaterialPageRoute(builder: (_) =>  SettingPage());
       case RouteGenerator.DoctorProfile:
        return MaterialPageRoute(builder: (_) =>  DocProfile());
        case RouteGenerator.DocSetting:
        return MaterialPageRoute(builder: (_) => DoctorSetting());
      case RouteGenerator.PetSetting:
        return MaterialPageRoute(builder: (_) => PatientSetting());
      case RouteGenerator.ExmainPageScreen:
        return MaterialPageRoute(builder: (_) => ExmainePage());
      case RouteGenerator.ResultMlScreen:
        return MaterialPageRoute(builder: (_) => Result_From_Ml());
      case RouteGenerator.FindDoctorHScreen:
        return MaterialPageRoute(builder: (_) => FindDoctorHome());
      case RouteGenerator.PublicProfileScreen:
        return MaterialPageRoute(builder: (_) => PublicDrProfile());
      case RouteGenerator.NotificationScreen:
        return MaterialPageRoute(builder: (_) => Notification_Page());
      case RouteGenerator.PharmacyScreen:
        return MaterialPageRoute(builder: (_) => Pharmacy());
      case RouteGenerator.KnowAboutPheumoniaScreen:
        return MaterialPageRoute(builder: (_) => KnowAboutPheumonia());
        case RouteGenerator.MapScreen:
        return MaterialPageRoute(builder: (_) => MapSample());

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
