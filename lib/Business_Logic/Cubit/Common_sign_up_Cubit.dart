import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/States/Common_sign_up_State.dart';
import 'package:top_care_gp/Business_Logic/CubitModel/Common_Sign_up_Model.dart';
 //عشان احفظ الداتا من صفحة ال common sign  و عند التسجيل كدكتور او مريض اخد الداتا الcommon  من ال cubit مع باقي الداتا من الصفح ل auth وال fire store
class Common_Sign_up_Cubit extends Cubit<Common_Sign_up_states> {

  Common_Sign_up_Cubit():super(Initial_Common_Sign_up_states());

 static Common_Sign_up_Cubit get(context) => BlocProvider.of(context);

  //Object to Common sign up Data model
 static Common_Sign_up_Model? CommonModel;

  //Function To Generate Common sign up Data model
void GenerateCommonSignUpModel({
    String? username,
    String? email,
    String? password,
    String? phone,
    String? gender,
    String? Type,
  }) {
    CommonModel = Common_Sign_up_Model(
        username: username,
        email: email,
        password: password,
        phone: phone,
        gender: gender,
        Type: Type );
    emit(Generate_Model_states());
  }
}
