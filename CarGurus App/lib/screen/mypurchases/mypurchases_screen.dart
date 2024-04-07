// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:carguru/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPurchasesScreen extends StatefulWidget {
  const MyPurchasesScreen({super.key});

  @override
  State<MyPurchasesScreen> createState() => _MyPurchasesScreenState();
}

class _MyPurchasesScreenState extends State<MyPurchasesScreen> {
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
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(12),
            child: Image.asset(
              "assets/back.png",
              color: notifire.getwhiteblackcolor,
            ),
          ),
        ),
        title: Text(
          "My purchases",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 15,
            color: notifire.getwhiteblackcolor,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 205,
                width: Get.size.width,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/calendar.png",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "June 10, 2022",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: greyScale,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(CarDetailsScreen());
                      },
                      child: Container(
                        height: 170,
                        width: Get.size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 100,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/jeep.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Audi Q7 Quattro",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: FontFamily.gilroyBold,
                                          fontSize: 16,
                                          color: notifire.getwhiteblackcolor,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Seller’s",
                                            style: TextStyle(
                                              fontFamily: FontFamily.gilroyMedium,
                                              color: greyScale,
                                              fontSize: 13,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "USA",
                                            style: TextStyle(
                                              fontFamily: FontFamily.gilroyMedium,
                                              color: notifire.getwhiteblackcolor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: grey50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "On progress",
                                    style: TextStyle(
                                      fontFamily: FontFamily.gilroyMedium,
                                      color: onbordingBlue,
                                      fontSize: 12,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: onbordingBlue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$80,063.00",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 15,
                                    color: notifire.getwhiteblackcolor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: notifire.getblackwhitecolor,
                          border: Border.all(color: notifire.getborderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
