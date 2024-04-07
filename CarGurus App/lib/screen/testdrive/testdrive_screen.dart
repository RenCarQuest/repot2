// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:carguru/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/App_content.dart';

class TestdriveOrderScreen extends StatefulWidget {
  const TestdriveOrderScreen({super.key});

  @override
  State<TestdriveOrderScreen> createState() => _TestdriveOrderScreenState();
}

class _TestdriveOrderScreenState extends State<TestdriveOrderScreen> {
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
            child: Image.asset(
              "assets/back.png",
              color: notifire.getwhiteblackcolor,
            ),
          ),
        ),
        title: Text(
          "Test drive",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 15,
            color: notifire.getwhiteblackcolor,
          ),
        ),
        actions: [
          Image.asset(Appcontent.calender, height: 24, width: 24, color: notifire.getwhiteblackcolor,),
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
                                    image: AssetImage("assets/jeep.png"),
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
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "10:40 AM - 11:40 AM",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: FontFamily.gilroyBold,
                                        color: notifire.getwhiteblackcolor,
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
