import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Business_Logic/CubitModel/FindDoctorModel.dart';
import 'package:top_care_gp/Business_Logic/States/Find_Dr_State.dart';
class Find_Dr_Cubit extends Cubit<Find_Dr_State> {

  Find_Dr_Cubit():super(Find_Dr_Initial_state());

  static Find_Dr_Cubit get(context) => BlocProvider.of(context);

  static List FindDrList =[
    Find_Dr_Model( img: "assets/images/drphoto.png",name: "Dr Ali Mohammed", disc: "Chest and respiratory diseases specialist",
        price: "250LE", Location: "Cairo,Egypt", Phone: "01247852369", rate: 6, FirstTime: "10:00 pm", LastTime: "3:00 pm",FavDr: false),
    Find_Dr_Model( img: "assets/images/drphoto.png",name: "Dr Mohammed Osama", disc: "PhD from the University of Cambridge",FavDr: true,
        price: "250LE", Location: "Cairo,Egypt", Phone: "01247852369", rate: 8, FirstTime: "10:00 pm", LastTime: "3:00 pm",),
    Find_Dr_Model( img: "assets/images/drphoto.png",name: "Dr Asmaa Mohammed", disc: "Chest and respiratory diseases specialist",
        price: "250LE", Location: "Cairo,Egypt", Phone: "01247852369", rate: 10, FirstTime: "10:00 pm", LastTime: "3:00 pm",FavDr: true),
    Find_Dr_Model( img: "assets/images/drphoto.png",name: "Dr Nader", disc: "PhD from the University of Cambridge",
        price: "250LE", Location: "Cairo,Egypt", Phone: "01247852369", rate: 7, FirstTime: "10:00 pm", LastTime: "3:00 pm",FavDr: false),
    Find_Dr_Model( img: "assets/images/drphoto.png",name: "Dr Khalid", disc: "Chest and respiratory diseases specialist",
        price: "250LE", Location: "Cairo,Egypt", Phone: "01247852369", rate: 4, FirstTime: "10:00 pm", LastTime: "3:00 pm",FavDr: true),




  ];


  // index of dr profile user chose to open
  static int? index_Of_Dr ;
  void OpenProfile (int? index){
    index_Of_Dr = index ;
    emit(Open_Dr_Profile_state());
  }

  //Function To Generate Data of dr from fire base to list of model
  static List FavDr = [];
}
