import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';

class DocProfile extends StatefulWidget{
  @override
  State<DocProfile> createState() => _DocProfileState();
}
class _DocProfileState extends State<DocProfile> {

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.MyUser;
    return Scaffold(
         appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            //جزء الصورة الويدجت بتاعتها تحت ف الكود
           ProfileWidget(
               imagePath: user.imagePath,
               onClicked: ()async{}
           ),
            SizedBox(
              height: 20,
            ),
            Container(

              child: Column(

                children: [
                  Row(
                    children: [
                      SizedBox(width: 130,),
                      Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              user.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),
                              //style: txtStyle(Colors.black, 25, true),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              user.specialization,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,

                              ),
                              //style: txtStyle(Colors.grey, 20, true),
                            ),
                          ],
                        ),

                      ),
                      SizedBox(width: 30,),
                      Container(
                        height: 40,
                        width: 75,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey[900],
                        ),
                        child: Center(
                          child: Text(
                              '250 LE',
                              style: TextStyle(
                                color: Colors.white,

                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(

                    width:300,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10,),
                  // الجزء بتاع الايكونات ف البروفايل فوق
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                        Icon(
                        Icons.people_alt,
                        color: Colors.grey,
                          size: 20,
                        ),
                          Text('Patient',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17
                          ),),
                          Text('2K',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.work,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text('Experience',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                            ),),
                          Text('7 y',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            size: 20,
                          ),
                          Text('Rating',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                            ),),
                          Text('4.0',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(

                    width:300,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10,),



                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  Container(
                    height: 80,
                    width: 370,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blueGrey[50],

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'skksnxn jxcn msj djncdlk ,dmskdchdeuf djnd bb hhy mjun nhxch cnhchc cnhchchh chhycyn bbh ggyd ddg jch bdhd cbdh bdgd cbg cggdg gcgcg'
                            'bggbbmj nhhh',
                          maxLines: 3,
                        style: TextStyle(
                           color: Colors.grey[800]
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Phone',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  Container(
                    height: 40,
                    width: 370,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blueGrey[50],

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' 01024141617 ',
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.grey[800]
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  Container(
                    height: 40,
                    width: 370,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blueGrey[50],

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' Cairo.Egypt ',
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.grey[800]
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Working days',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('           Sat     Sun     Mon     Tue      Wen',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18 ,
                        color: ColorManager.BlueBasiColor
                      ),
                      ),

                    ],
                  ),
                  SizedBox(height: 40,),
                  Text('Time',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        width: 75,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorManager.BlueBasiColor,
                        ),
                        child: Center(
                          child: Text(
                              '10:00 Am',
                              style: TextStyle(
                                color: Colors.white,

                              )
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward
                      ),
                      Container(
                        height: 40,
                        width: 75,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorManager.BlueBasiColor,
                        ),
                        child: Center(
                          child: Text(
                              '02:00 Pm',
                              style: TextStyle(
                                color: Colors.white,

                              )
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
    );
  }


}
//جزء ال appbar
AppBar buildAppBar(BuildContext context ){
  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
// جزء الصورة بتاعت البروفايل

class ProfileWidget extends StatelessWidget{
  final String imagePath;
  final VoidCallback onClicked;
  const ProfileWidget({
    required this.imagePath,
    required this.onClicked
  });
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(ColorManager.BlueBasiColor),
          ),
        ],
        //
      ),
    );
  }
  Widget buildImage(BuildContext context){

    final image=AssetImage("assets/images/hos.jpg");
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child:
          CircleAvatar(
            child: Image(image: image , fit: BoxFit.contain,),
            maxRadius: 90,
            backgroundColor: Colors.white,
          ),
        // Ink.image(
        //   image: image,
        //   fit: BoxFit.cover,
        //   height: Height*0.2,
        //   width: Width*0.3,
        //   child: InkWell(
        //     onTap: onClicked,
        //   ),
        // ),
      ),
    );
  }
  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 8,
    child: buildCircle(
      color :color,
      all :8,
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
  Widget buildCircle({
    required  Widget child,
    required double all,
    required Color color
  }) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child ,
    ),
  );
}
//الداتا بتاعت اليوزر
class User{
  final String imagePath;
  final String name;
  final String specialization;
  final String about;
  const User({
    required this.imagePath,
    required this.name,
    required this.specialization,
    required this.about
  });
}
class UserPreferences{
  static const MyUser =User(
      imagePath: "assets/images/hos.jpg",
      name: 'Dr Noha',
      specialization: 'Sr.Cardiolodist',
      about: 'kjkj nxjx nxjjx kkjn '
  );
}
