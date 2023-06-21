import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/CommentDrModel.dart';
import 'package:top_care_gp/Data/Models/GeneralInfoPhenModel.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Know_About_Pneumonia/SconedpageInfo.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';

class KnowAboutPheumonia extends StatefulWidget {
  const KnowAboutPheumonia({super.key});

  @override
  State<KnowAboutPheumonia> createState() => _KnowAboutPheumoniaState();
}

class _KnowAboutPheumoniaState extends State<KnowAboutPheumonia> {
  // know about data
  final List<GeneralInfoPhenModel> items = [
    GeneralInfoPhenModel(
        img: 'assets/images/kn1.png',
        title: "What is a Pneumonia ?",
        subtitle: "Pneumonia is a type of lung can affect one or both lungs."
            " It can be caused by various bacteria, viruses",
        detailes: "The air sacs may fill with fluid or pus (purulent material)"
            "causing cough with phlegm or pus, fever, chills, and difficulty breathing."
            "A variety of organisms, including bacteria, viruses and fungi, can cause pneumonia."
            "Pneumonia can range in seriousness from mild to life-threatening."
            "It is most serious for infants and young children, people older than age 65,"
            " and people with health problems or weakened immune systems."),
    GeneralInfoPhenModel(
        img: 'assets/images/kn2.png',
        title: 'How do I know if I have the Pneumonia ?',
        subtitle:
            "Cough with mucus or phlegm\nFever usually of high grade with chills\nFast breathing",
        detailes:
            "Shortness of breath\nChest pain while coughing\nFast heartbeat\nFeeling very tired or very weak\nNausea and vomiting\nDiarrhea\nLoss of appetite\nBody pain\nSeverely affected patients my cough up blood or show cyanosis \n(have a blue color around the mouth due to lack of oxygen)"),
    GeneralInfoPhenModel(
        img: 'assets/images/kn3.png',
        title: 'How do I protect myself ?',
        subtitle:
            "Eating a healthy diet\nGetting enough rest\nand exercising regularly ",
        detailes: "1.Get Vaccinated\n"
            "2.Get Enough Sleep\n"
            "3.Keep acid reflux under control and protect yourself from aspiration\n"
            "4.Limit alcohol, smoking, and vaping\n"
            "5.Don’t stop exercising\n"
            "6.Optimize weight to protect or mitigate risks of pneumonia caused by Chronic Diseases such as Diabetes mellitus"),
  ];
  // comment data
  final List<CommentDrModelModel> listcomment = [
    CommentDrModelModel(
      img: "assets/images/drphoto.png",
      namedr: 'Dr : Ahmed Ali',
      commentInf: "Manage underlying health conditions",
    ),
    CommentDrModelModel(
      img: "assets/images/drphoto.png",
      namedr: 'Dr : Ibrahim Mohamed',
      commentInf:
          "Chronic conditions like asthma, diabetes, and heart disease can "
          " increase the risk of developing pneumonia",
    ),
    CommentDrModelModel(
      img: "assets/images/drphoto.png",
      namedr: 'Dr : Joun Hali',
      commentInf: 'i recommend this protocol',
    ),
    CommentDrModelModel(
      img: "assets/images/drphoto.png",
      namedr: 'Dr : Ibrahim Mohamed',
      commentInf: 'i recommend this protocol',
    ),
  ];
  //Know about widget
  Widget continerinfo(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.BlueBasiColor,
          borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 60.0))),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Information About Pneumonia',
              style: TextStyle(
                color: ColorManager.WitheToDarkColor(context),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SconedpageInfo(
                                  model: items[index],
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30, right: 10, left: 10, top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              items[index].img,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              items[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.DarkColorOnly,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              items[index].subtitle,
                              style: const TextStyle(
                                  fontSize: 15.0, color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget comment(String image, String namedr, String comentinfo) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              image,
            ),
            radius: 20,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namedr,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.DarkBasiColor(context)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.LGrayBasiColor.withOpacity(0.9)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      comentinfo,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: ColorManager.DarkColorOnly),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Height),
        child: Stack(children: [
          const SizedBox(
            height: 10,
          ),
          continerinfo(context),
          Positioned(
              top: 20,
              left: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.HomeRoute);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp),
                color: ColorManager.WitheToDarkColor(context),
              )),
        ]),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listcomment.length,
            itemBuilder: (BuildContext context, int index) {
              return comment(
                listcomment[index].img,
                listcomment[index].namedr,
                listcomment[index].commentInf,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.BlueBasiColor,
        onPressed: () async {
          await showDialgAdd();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  String selectedName = "";
  String commentt = '';
  String selectedImage = 'assets/images/drphoto.png';

  Future<dynamic> showDialgAdd() {
    return showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorManager.WitheToDarkColor(context),
          title: Text('Add Comment'),
          content: Container(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  style: TextStyle(
                      color: ColorManager.DarkColorOnly,
                      fontSize: 15,
                      decoration: TextDecoration.none),
                  maxLines: 5,
                  cursorColor: ColorManager.DGrayBasiColor,
                  onChanged: (value) {
                    setState(() {
                      commentt = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.LGrayBasiColor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorManager.LGrayBasiColor,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorManager.LGrayBasiColor,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    setState(() {
                      listcomment.add(CommentDrModelModel(
                          img: "assets/images/drphoto.png",
                          namedr: " Dr : Ahmed ALi",
                          commentInf: commentt));
                      commentt = "";
                    });

                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.send,
                    color: ColorManager.BlueBasiColor,
                    weight: 30,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
