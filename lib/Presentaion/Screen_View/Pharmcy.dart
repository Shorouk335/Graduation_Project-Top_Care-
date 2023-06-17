import 'package:flutter/material.dart';
import 'package:top_care_gp/Data/Models/Pharmacy_Model.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Top_Carve.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/color_manager/color_manager.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Pharmacy extends StatelessWidget {
  const Pharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    List<PharmacyModel> list = [
      PharmacyModel("assets/images/ph1.jpeg", "Alamerpharmacy", "33 st ,cairo",
          "19600", "elezabypharmacy.com/ar/home/", "15%"),
      PharmacyModel("assets/images/ph2.jpeg", "Elezabypharmacy", "33 st ,cairo",
          "19600", "amerpharmacies.com/?lang=ar", "20%"),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: Stack(children: [
          TopCarve(context: context, Havetitle: true, title: "Pharmacies"),
          Positioned(
              top: 50,
              left: 10,
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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return phContainer(
              context,
              list[index].img,
              list[index].name,
              list[index].location,
              list[index].phone,
              list[index].website,
              list[index].over);
        },
      ),
    );
  }

  Widget phContainer(BuildContext context, String img, String name, String loc,
      String phone, String website, String over) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorManager.LGrayBasiColor.withOpacity(0.9)),
        height: 180,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.DarkColorOnly),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: ColorManager.DarkColorOnly),
                      SizedBox(width: 5),
                      Text(
                        loc,
                        style: TextStyle(
                            fontSize: 13, color: ColorManager.DarkColorOnly),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      UrlLauncher.launch("tel://${phone}");
                    },
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: ColorManager.DarkColorOnly),
                        SizedBox(width: 8),
                        Text(
                          phone,
                          style: TextStyle(
                              fontSize: 13, color: ColorManager.DarkColorOnly),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      UrlLauncher.launch("https://${website}");
                    },
                    child: Row(
                      children: [
                        Icon(Icons.link, color: ColorManager.DarkColorOnly),
                        SizedBox(width: 8),
                        Text(
                          'Visit Website',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              color: ColorManager.DarkColorOnly),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 55.0,
              height: 55.0,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  '15%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            )
          ],
        ),
      ),
    );
  }
}
