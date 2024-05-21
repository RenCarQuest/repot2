// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:carguru/presentation/features/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/core/constants/Colors.dart';
import 'package:carguru/core/utils/Dark_lightmode.dart';
import 'package:carguru/core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/App_content.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late ColorNotifire notifire;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    getdarkmodepreviousstate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(12),
            child: Image.asset("assets/images/back.png", color: notifire.getwhiteblackcolor,),
          ),
        ),
        title: Text("Appointment", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
        actions: [
          Image.asset(Appcontent.calender, height: 24, width: 24, color: notifire.getwhiteblackcolor),
          SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: notifire.getbgcolor),
                  ),
                  hintText: 'Search message',
                  hintStyle: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 16, color: notifire.getwhiteblackcolor),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(Appcontent.search, height: 24, width: 24,color: notifire.getwhiteblackcolor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.size.height,
              width: Get.size.width,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(CarDetailsScreen());
                    },
                    child: Container(
                      height: 160,
                      width: Get.size.width,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/jeep.png"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ford Mustang GT",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: FontFamily.gilroyExtraBold,
                                        color: notifire.getwhiteblackcolor,
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Sacramento, California",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: FontFamily.gilroyMedium,
                                        color: greyScale,
                                        fontSize: 13,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(
                            color: grey50,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        fontFamily: FontFamily.gilroyMedium,
                                        color: greyScale,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/calendar.png",
                                          height: 16,
                                          width: 16,
                                          color: onbordingBlue,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "June 10, 2022",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: FontFamily.gilroyBold,
                                            color: notifire.getwhiteblackcolor,
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Time",
                                      style: TextStyle(
                                        fontFamily: FontFamily.gilroyMedium,
                                        color: greyScale,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/clock1.png",
                                          height: 16,
                                          width: 16,
                                          color: onbordingBlue,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "10:40 AM - 11:40 AM",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: FontFamily.gilroyBold,
                                            color: notifire.getwhiteblackcolor,
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: notifire.getblackwhitecolor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: notifire.getborderColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
