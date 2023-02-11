import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Presentaion/Screen_View/Sign_up/Common_sign_up.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/SubmitButton.dart';
import 'package:top_care_gp/Presentaion/Shared_Components/TextFormWidget.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Theme/Light_Theme.dart';

class Dr_sign_up extends StatefulWidget {
  const Dr_sign_up({super.key});

  @override
  State<Dr_sign_up> createState() => _Dr_sign_upState();
}

class _Dr_sign_upState extends State<Dr_sign_up> {

  var aboutController = TextEditingController();
  var SpecializationController = TextEditingController();
  var locationController = TextEditingController();
  var priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();
//by day
  final values = List.filled(7, false);

//text to reminder Hello Doctor , Please complete your info
  Widget firstText() {
    return Text('Hello Doctor , Please complete your info',
        style: txtStyle(ColorManager.BlueBasiColor, 16.0, true));
  }

//form have 4 textfeiled
  Widget form() {
    return Form(
        key: formKey,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            child: TextFormWidget(
              controller: aboutController,
              icon: Icons.info_outline_rounded,
              txt: "About You..",
              password: false,
              ontap: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            child: TextFormWidget(
              controller: SpecializationController,
              icon: Icons.speaker_group_outlined,
              txt: "Specialization",
              password: false,
              ontap: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            child: TextFormWidget(
              controller: locationController,
              icon: Icons.location_searching_outlined,
              txt: "Your Location",
              password: false,
              ontap: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            child: TextFormWidget(
              controller: priceController,
              icon: Icons.price_check_outlined,
              txt: "Price ",
              password: false,
              ontap: () {},
            ),
          ),
        ]));
  }

//time select
  TimeOfDay selectedTime1 = const TimeOfDay(hour: 0, minute: 00);
  TimeOfDay selectedTime2 = const TimeOfDay(hour: 0, minute: 00);

  Future<void> selectTime1(BuildContext context) async {
    final TimeOfDay? pick =
        await showTimePicker(context: context, initialTime: selectedTime1);

    if (pick != null && pick != selectedTime1) {
      setState(() {
        selectedTime1 = pick;
      });
    }
  }

  Future<void> selectTime2(BuildContext context) async {
    final TimeOfDay? pick2 =
        await showTimePicker(context: context, initialTime: selectedTime1);

    if (pick2 != null && pick2 != selectedTime2) {
      setState(() {
        selectedTime2 = pick2;
      });
    }
  }

  Widget ttime(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "From ",
            style: txtStyle(ColorManager.DarkBasiColor, 13.0, true),
          ),
          InkWell(
            onTap: () {
              selectTime1(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 90,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorManager.BlueBasiColor,
              ),
              child: Text(selectedTime1.format(context).toString(),
                  style: txtStyle(ColorManager.DarkBasiColor, 10.0, true),
                  textAlign: TextAlign.center),
            ),
          ),
          Text("To",
              style: txtStyle(ColorManager.DarkBasiColor, 13.0, true),
              textAlign: TextAlign.center),
          InkWell(
            onTap: () {
              selectTime2(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 90,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorManager.BlueBasiColor,
              ),
              child: Text(
                selectedTime2.format(context).toString(),
                style: txtStyle(ColorManager.DarkBasiColor, 10.0, true),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

//day_picker
  printIntAsDay(int day) {
    print(
        'Received integer: $day. Corresponds to day: ${intDayToEnglish(day)}');
  }

  String intDayToEnglish(int day) {
    if (day % 7 == DateTime.monday % 7) return 'Monday';
    if (day % 7 == DateTime.tuesday % 7) return 'Tueday';
    if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
    if (day % 7 == DateTime.thursday % 7) return 'Thursday';
    if (day % 7 == DateTime.friday % 7) return 'Friday';
    if (day % 7 == DateTime.saturday % 7) return 'Saturday';
    if (day % 7 == DateTime.sunday % 7) return 'Sunday';
    throw '🐞 This should never have happened: $day';
  }

  List<DayInWeek> days = [
    DayInWeek(
      "Mo",
    ),
    DayInWeek(
      "Tu",
    ),
    DayInWeek(
      "We",
    ),
    DayInWeek(
      "Th",
    ),
    DayInWeek(
      "Fr",
    ),
    DayInWeek(
      "Sa",
    ),
    DayInWeek("Su", isSelected: true),
  ];

  Widget daypick() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectWeekDays(
        selectedDayTextColor: ColorManager.BlueBasiColor,
        unSelectedDayTextColor: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        days: days,
        border: false,
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        onSelect: (values) {
          print(values);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double? HEIGHT = MediaQuery.of(context).size.height;
    double? WIDTH = MediaQuery.of(context).size.width;
    double? BodyHeight = HEIGHT -
        AppBar().preferredSize.height -
        100.0 -
        MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                  child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: BodyHeight * 0.1,
                  // ),
                  firstText(),
                  SizedBox(
                    height: BodyHeight * 0.05,
                  ),
                  form(),
                  SizedBox(
                    height: BodyHeight * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      "working days",
                      style: txtStyle(ColorManager.DarkBasiColor, 16.0, true),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: BodyHeight * 0.002,
                  ),
                  daypick(),
                  SizedBox(
                    height: BodyHeight * 0.002,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                    child: Text(
                      "Time",
                      style: txtStyle(ColorManager.DarkBasiColor, 17.0, true),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ttime(context),
                  SizedBox(
                    height: BodyHeight * 0.08,
                  ),
                  submitButton("Submit", () async {
                    if (formKey.currentState!.validate()) {
                      await SignUpWithFire(context,
                          email: "shorouk56@gmail.com", password: "12345678");
                    }
                    return null;
                  }),
                ]),
        )),
            )));
  }
}
