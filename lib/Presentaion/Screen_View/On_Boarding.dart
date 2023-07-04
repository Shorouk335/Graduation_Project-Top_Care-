import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top_care_gp/Data/Models/PageViewModel.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/Page_View_Item.dart';
import 'package:top_care_gp/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/String_Manager/String_Manager.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';
// show some pages that explain what is the major of application

class OnBoarding extends StatelessWidget {
  //to navigator to login screen on last pageview
  var indexPageView = 0;

  // control of pageview widgets to know the number of page that I'm in
  var controller = PageController();

  //List of Data of 3 pages from class pageViewModel
  List<PageViewModel> PageViewData = [
    PageViewModel(
      img: AssetManager.onBord2,
      title: StringManager.onBordTitle2,
      disc: StringManager.onBordDis2,
      Hsize: 3,
    ),
    PageViewModel(
      img: AssetManager.onBord3,
      title: StringManager.onBordTitle3,
      disc: StringManager.onBordDis3,
      Hsize: 2.5,
    ),
    PageViewModel(
      img: AssetManager.onBord1,
      title: StringManager.onBordTitle1,
      disc: StringManager.onBordDis1,
      Hsize: 2.5,
    ),
  ];

  // Img + title + disc
  Widget Content() {
    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: PageViewData.length,
        itemBuilder: (context, index) {
          return PageViewItem(context: context, model: PageViewData[index]);
        },
        controller: controller,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) {
          indexPageView = index;
        },
      ),
    );
  }

  // 3 Dots move with pageView Widget by controller in pageView widgets
  Widget Dots() {
    return SmoothPageIndicator(
      count: PageViewData.length,
      controller: controller,
      effect: ExpandingDotsEffect(
        activeDotColor: ColorManager.BlueBasiColor,
        dotColor: ColorManager.LGrayBasiColor,
        dotHeight: 10,
        dotWidth: 10,
        expansionFactor: 3,
        spacing: 5,
      ),
    );
  }

  //Skip & Next Botton
  Widget Bottons(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 37,
            backgroundColor: Colors.grey.shade200,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, RouteGenerator.HomeRoute);
            },
            child: CircleAvatar(
              radius: 34,
              backgroundColor: ColorManager.DGrayBasiColor,
              child: Text(
                "Skip",
                style: txtStyle(Colors.white, 15.0, false),
              ),
            ),
          ),
        ],
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 37,
            backgroundColor: ColorManager.LBlueBasiColor,
          ),
          InkWell(
            onTap: () {
              if (indexPageView == PageViewData.length - 1) {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.HomeRoute);
              }
              controller.nextPage(
                  duration: Duration(
                    milliseconds: 750,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn);
            },
            child: CircleAvatar(
              radius: 34,
              backgroundColor: ColorManager.BlueBasiColor,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Content(),
            Dots(),
            Bottons(context),
          ]),
        ),
      ),
    );
  }
}
