import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/CubitModel/Scan_Xray_Model.dart';
import 'package:top_care_gp/Business_Logic/States/Scan_Xray_State.dart';
class Scan_Xray_Cubit extends Cubit<Scan_Xray_States> {

  Scan_Xray_Cubit():super(Initial_Scan_Xray_States());

  static Scan_Xray_Cubit get(context) => BlocProvider.of(context);

  //Objects of models of data
  //object of img
  static Scan_Xray_Img_Model? scan_xray_Img_model ;
  // object of data
  static Scan_Result_From_ML_Model? scan_result_from_ml_model ;

  //Function To Upload img from user and save in model
  void Upload_Img(String Img_Xray  ) {
    scan_xray_Img_model = Scan_Xray_Img_Model(
    Img_Xray: Img_Xray,);

    emit(Upload_Img_From_User_state());
  }

  //Function To clear img in model
  void Clear_Img() {
    scan_xray_Img_model!.Img_Xray= null;
    emit(Clear_Img_From_User_state());
  }

 //Function to upload data from ml and save in model
  void Upload_Data_From_Ml (String Result_Text , String Result_num){
  scan_result_from_ml_model  = Scan_Result_From_ML_Model(
    Result_Text: Result_Text,
    Result_num: Result_num);
   emit(Upload_Data_From_Ml_state());
  }

  //Function to clear data model
  void Clear_Data_From_Ml (){
    scan_result_from_ml_model!.Result_Text = null;
    scan_result_from_ml_model!.Result_num= null;
    emit(Clear_Data_From_Ml_state());
  }


}



