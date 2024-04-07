// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace
import 'package:carguru/controller/home_controller.dart';
import 'package:carguru/model/model.dart';
import 'package:carguru/screen/addlocation/location_screen.dart';
import 'package:carguru/screen/availablecar/availablecar_screen.dart';
import 'package:carguru/screen/availablecar/brandcar_screen.dart';
import 'package:carguru/screen/bottombar/brand_screen.dart';
import 'package:carguru/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/App_content.dart';
import '../message_screen/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List img = [
    Appcontent.tesla,
    Appcontent.toyota,
    Appcontent.bmw,
    Appcontent.lamborghini,
    Appcontent.ford,
  ];
  List logoname = [
    'Tesla',
    'Toyota',
    'BMW',
    'Lamborghini',
    'Ford',
  ];
  int favorite = 0;
  HomeController homeController = Get.find();
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
    homeController.changShimmer();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (context) {
          return Column(
            children: [
              SizedBox(height: 5,),
              Container(
                height: 50,
                width: Get.size.width,
                color: notifire.getbgcolor,
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: () {
                        Get.to(LocationScreen());
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        padding: EdgeInsets.all(8),
                        child: Image.asset("assets/map-pin.png", height: 25, width: 25, color: notifire.getwhiteblackcolor,),
                        decoration: BoxDecoration(
                          border: Border.all(color: notifire.getborderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Location", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 12,),),
                          SizedBox(height: 4,),
                          Text("San Fransisco", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(NotificationScreen()),
                      child: Container(
                        height: 45,
                        width: 45,
                        padding: EdgeInsets.all(8),
                        child: Image.asset("assets/notification.png", height: 25, width: 25, color: notifire.getwhiteblackcolor,),
                        decoration: BoxDecoration(
                          border: Border.all(color: notifire.getborderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(BrandScreen());
                          },
                          child: Container(
                            height: 50,
                            width: Get.size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 15,),
                                Text("Search cars...", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyColor, fontSize: 15,),),
                                Spacer(),
                                Image.asset("assets/Search.png", height: 25, width: 25, color: notifire.getwhiteblackcolor,),
                                SizedBox(width: 15,),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: notifire.getblackwhitecolor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        SizedBox(
                          height: 55,
                          width: Get.size.width,
                          child: ListView.builder(
                            itemCount: model().catList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return homeController.isLoading
                                  ? Container(
                                      height: 55,
                                      margin: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(left: 10, right: 15),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/car.png", height: 25, width: 25, color: notifire.getwhiteblackcolor,),
                                          SizedBox(width: 5,),
                                          Text(model().catList[index], style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 15, color: notifire.getwhiteblackcolor,),),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: notifire.getborderColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )
                                  : categoryShimmer();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Text("Car recommendation", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 18,),),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Get.to(AvailablecarScreen());
                              },
                              child: Text("View all", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 15,),),),
                          ],
                        ),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return homeController.isLoading
                                ? InkWell(
                                    onTap: () {
                                      Get.to(CarDetailsScreen());
                                    },
                                    child: Container(
                                      height: 270,
                                      width: Get.size.width,
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 15,),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                alignment: Alignment.center,
                                                child: Text("Free test drive", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor,),),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: onbordingBlue,
                                                ),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  favorite = index;
                                                },
                                                  child: favorite == index ? Image.asset("assets/heart.png", height: 28, width: 28, color: Colors.red,) : Image.asset("assets/heart.png", height: 28, width: 28,)),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Container(
                                            height: 110,
                                            width: Get.size.width,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage("assets/car1.png"),),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text("Audi R8 Performance RWD",style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,)),
                                              ),
                                              SizedBox(width: 5,),
                                              Image.asset("assets/star.png", height: 16, width: 16,),
                                              SizedBox(width: 2,),
                                              Text("4.8", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 14,),)
                                            ],
                                          ),
                                          SizedBox(height: 8,),
                                          Divider(color: greyScale,),
                                          SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Image.asset("assets/engine.png", height: 20, width: 20,),
                                              SizedBox(width: 4,),
                                              Text("540 hp", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 13,),),
                                              SizedBox(width: 10,),
                                              Image.asset("assets/manual-gearbox.png", height: 20, width: 20,),
                                              SizedBox(width: 4,),
                                              Text("Automatic", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 13,),),
                                              Spacer(),
                                              Text("\$176,037.11", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                                            ],
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: notifire.getborderColor),
                                        borderRadius: BorderRadius.circular(20),
                                        color: notifire.getblackwhitecolor,
                                      ),
                                    ),
                                  )
                                : carRecomendationShimmer(notifire);
                          },
                        ),
                        Row(
                          children: [
                            Text("Top brands", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 18,),),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  Get.to(Brand1Screen());
                                },
                                child: Text("View all", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 15,),)
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 120,
                          width: Get.size.width,
                          child: ListView.builder(
                            itemCount: img.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return homeController.isLoading
                                  ? Container(
                                      height: 120,
                                      width: 93,
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            padding: EdgeInsets.all(10),
                                            child: index == 2 ? Image.asset(img[2], color: Colors.black,) : Image.asset(img[index]),
                                            decoration: BoxDecoration(
                                                border: Border.all(color: notifire.getborderColor, width: 1),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(logoname[index], style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),)
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: notifire.getborderColor),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    )
                                  : topBrandShimmer();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Text("Car recommendation", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 18,),),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  Get.to(AvailablecarScreen());
                                },
                                child: Text("View all", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 15,),)
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 260,
                          width: Get.size.width,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return homeController.isLoading
                                  ? InkWell(
                                     onTap: () {
                                       Get.to(CarDetailsScreen());
                                     },
                                    child: Container(
                                        height: 260,
                                        width: 228,
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Image.asset("assets/Audi.png", height: 15, width: 50,),
                                                Spacer(),
                                                Image.asset(
                                                  "assets/heart.png",
                                                  height: 25,
                                                  width: 28,
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 110,
                                              width: Get.size.width,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/audiCar.png"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Audi A8 Quattro",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FontFamily.gilroyBold,
                                                      fontSize: 15,
                                                      color: notifire
                                                          .getwhiteblackcolor,
                                                    ),
                                                  ),
                                                ),
                                                Image.asset(
                                                  "assets/star.png",
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  "4.8",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.gilroyMedium,
                                                    color: greyScale1,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Divider(
                                              color: greyScale,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/engine.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Automatic",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.gilroyMedium,
                                                    color: greyScale1,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "\$112,150.00",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.gilroyBold,
                                                    fontSize: 15,
                                                    color: onbordingBlue,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                              color: notifire.getborderColor),
                                          color: notifire.getblackwhitecolor,
                                        ),
                                      ),
                                  )
                                  : carRecomendationUpShimmer();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  categoryShimmer() {
    return Container(
      height: 55,
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10, right: 15),
      child: Shimmer.fromColors(
        baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
        highlightColor: notifire.isDark ? Color(0xFF475569) : Color(0xFFeaeff4),
        enabled: true,
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: notifire.getblackwhitecolor,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 15,
              width: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: notifire.getblackwhitecolor,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: notifire.getborderColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  topBrandShimmer() {
    return Container(
      height: 120,
      width: 93,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Shimmer.fromColors(
        baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
        highlightColor: notifire.isDark ? Color(0xFF475569) : Color(0xFFeaeff4),
        enabled: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 15,
              width: 70,
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: notifire.getborderColor),
        borderRadius: BorderRadius.circular(20),
        color: notifire.getblackwhitecolor,
      ),
    );
  }

  carRecomendationUpShimmer() {
    return Container(
      height: 260,
      width: 228,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Shimmer.fromColors(
        baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
        highlightColor: notifire.isDark ? Color(0xFF475569) : Color(0xFFeaeff4),
        enabled: true,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Spacer(),
                Image.asset(
                  "assets/heart.png",
                  height: 25,
                  width: 28,
                ),
              ],
            ),
            Container(
              height: 110,
              width: Get.size.width,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Spacer(),
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: greyScale,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Spacer(),
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: notifire.getborderColor),
        color: notifire.getblackwhitecolor,
      ),
    );
  }
}
