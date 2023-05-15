import 'package:flutter/material.dart';

class PatientSetting extends StatelessWidget{
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

                        ],
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
                SizedBox(height: 10,),
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
                Text('History',
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
                SizedBox(height: 40,),
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
    final image=AssetImage('assets/images/wom.jpg');
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          height: 128,
          width: 128,
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
  const User({
    required this.imagePath,
    required this.name,

  });
}
class UserPreferences{
  static const MyUser =User(
    imagePath: 'assets/images/wom.jpg',
    name: 'Heba Samy',

  );
}