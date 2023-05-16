//Img from user
class Scan_Xray_Img_Model {

  dynamic Img_Xray  ;

  Scan_Xray_Img_Model({required this.Img_Xray});

}
//Data from ml
class Scan_Result_From_ML_Model {
  dynamic Result_Text ;
  dynamic Result_num ;

  Scan_Result_From_ML_Model({required this.Result_Text , required this.Result_num});

}