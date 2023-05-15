import 'package:flutter/material.dart';

class DoctorSetting extends StatefulWidget{
  @override
  State<DoctorSetting> createState() => _DoctorSettingState();
}

class _DoctorSettingState extends State<DoctorSetting> {
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





              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email',
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
                      ' Heba12@gmail.com ',
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.grey[800]
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text('Password',
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
                      ' 1253heba3 ',
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.grey[800]
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
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
                SizedBox(height: 5,),
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
                SizedBox(height: 5,),
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
                SizedBox(height: 5,),
                Text('Working days',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('           Sat     Sun     Mon     Tue      Wen',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18 ,
                          color: Colors.lightBlueAccent
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 5,),
                Text('Time',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 75,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent,
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
                        color: Colors.lightBlueAccent,
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
                SizedBox(height: 5,),
                Row(
                  children: [
                    Center(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height: 40,
                          width: 370,


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey,
                          ),
                          child: Center(
                            child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,

                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

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
    actions: [
      IconButton(onPressed: (){}, icon: Icon(
          Icons.edit
      ))
    ],
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
          buildImage(),

        ],
        //
      ),
    );
  }
  Widget buildImage(){
    final image=AssetImage('assets/images/hos.jpg');
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          height: 120,
          width: 120,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

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
      imagePath: 'assets/images/hos.jpg',
      name: 'Dr Noha',
      specialization: 'Sr.Cardiolodist',
      about: 'kjkj nxjx nxjjx kkjn '
  );
}
