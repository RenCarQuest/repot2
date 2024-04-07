// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, unused_field, sized_box_for_whitespace
import 'package:carguru/controller/cardetails_controller.dart';
import 'package:carguru/screen/detailcar/360_screen.dart';
import 'package:carguru/screen/detailcar/detailsviewall_screen.dart';
import 'package:carguru/screen/detailcar/buycardetails_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/App_content.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  CardetailsController cardetailsController = Get.find();

  List detailsList = [
    "Details",
    "Features",
    "Design",
    "Price map",
    "Reviews",
  ];
  List text =[
    '5 star',
    '4 star',
    '3 star',
    '2 star',
    '1 star ',
  ];
  List<Color> colors = [
    Colors.amber,
    greyScale1,
    greyScale1,
    greyScale1,
    greyScale1,
  ];

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
        backgroundColor: Color(0xFF0F172A),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(12),
            child: Image.asset("assets/back.png", color: greyScale,),
          ),
        ),
        actions: [
          Image.asset("assets/favoriteOutline.png", height: 25, width: 25, color: greyScale,),
          SizedBox(width: 18),
          Image.asset("assets/share-two.png", height: 25, width: 25, color: greyScale),
          SizedBox(width: 20),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: Get.size.width,
        alignment: Alignment.center,
        color: notifire.getbgcolor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Price (Cash)", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 14,),),
                SizedBox(height: 6),
                Text("\$80,063", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 20, color: notifire.getwhiteblackcolor,),),
              ],
            ),
            Spacer(),
            GestButton(
              height: 50,
              Width: 160,
              margin: EdgeInsets.all(8),
              buttoncolor: onbordingBlue,
              buttontext: "Buy",
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: WhiteColor,
                fontSize: 15,
              ),
              onclick: () {
                Get.to(BuyCarDetailsScreen());
              },
            ),
          ],
        ),
      ),
      body: GetBuilder<CardetailsController>(builder: (context) {
        return SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Get.to(OpencarScreen());
                },
                child: Stack(
                  children: [
                    Container(
                      height: Get.size.height * 0.45,
                      width: Get.size.width,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 45),
                      child: Image.asset("assets/car2.png"),
                      decoration: BoxDecoration(
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 120,
                            alignment: Alignment.center,
                            child: Text("Free test drive", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor,),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: onbordingBlue,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Audi Q7 50 Quattro", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 22,),),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 20,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Get.to(OpencarScreen());
                            },
                            child: Container(
                              height: 40,
                              width: 81,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff1E293B),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(Appcontent.arrowleft, height: 14, width: 14,),
                                  Text('360', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),),
                                  Image.asset(Appcontent.arrowright, height: 14, width: 14,),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: 80,
                width: Get.size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 80,
                            width: 110,
                            margin: EdgeInsets.all(5),
                            child: Image.asset("assets/porche.png"),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: notifire.getborderColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(DetailsViewAll());
                      },
                      child: Container(
                        height: 80,
                        width: 55,
                        margin: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/box.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "View all",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyBold,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: notifire.getblackwhitecolor,
                          border: Border.all(color: notifire.getborderColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 109,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: notifire.getblackwhitecolor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/engine.png", height: 30, width: 30, color: notifire.getwhiteblackcolor,),
                          SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "335", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 17, color: notifire.getwhiteblackcolor,),),
                                TextSpan(text: " HP", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 13, color: greyScale1,),)
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("Horsepower", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 14, color: greyScale1,),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 109,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: notifire.getblackwhitecolor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/dashboard.png",
                            height: 30,
                            width: 30,
                            color: notifire.getwhiteblackcolor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "369",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 17,
                                    color: notifire.getwhiteblackcolor,
                                  ),
                                ),
                                TextSpan(
                                  text: " Ib-ft",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyMedium,
                                    fontSize: 13,
                                    color: greyScale1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Torque",
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyMedium,
                              fontSize: 14,
                              color: greyScale1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 109,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: notifire.getblackwhitecolor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/clock.png",
                            height: 30,
                            width: 30,
                            color: notifire.getwhiteblackcolor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "5.6",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 17,
                                    color: notifire.getwhiteblackcolor,
                                  ),
                                ),
                                TextSpan(
                                  text: " sec",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyMedium,
                                    fontSize: 13,
                                    color: greyScale1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "0-60 mph",
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyMedium,
                              fontSize: 14,
                              color: greyScale1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 55,
                width: Get.size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    itemCount: detailsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          cardetailsController.changeIndex(index: index);
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              alignment: Alignment.center,
                              child: Text(detailsList[index], style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: cardetailsController.currentIndex == index ? onbordingBlue : greyScale1,),),
                            ),
                            SizedBox(height: 4,),
                            cardetailsController.currentIndex == index
                                ? Container(
                                    height: 2,
                                    width: 80,
                                    color: onbordingBlue,
                                  )
                                : SizedBox()
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              cardetailsController.currentIndex == 0 ? detailsWidget()
                  : cardetailsController.currentIndex == 1 ? featuresWidget()
                      : cardetailsController.currentIndex == 2 ? designWidget()
                          : cardetailsController.currentIndex == 3 ? priceMapWidget()
                              : cardetailsController.currentIndex == 4 ? reviewsWidget() : SizedBox(),
            ],
          ),
        );
      }),
    );
  }

  detailsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text("Audi Q7 50 Quattro with automatic transmission in Carara White with Laser headlights and a Black optic. As the most substantial SUV in the Audi lineup, the Audi Q7 has ample cargo room and more-than-accommodating passenger capacity—proving that bigger is better.", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 14, color: greyScale1,),),
          SizedBox(height: 15,),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              collapsedIconColor: notifire.getwhiteblackcolor,
              title: Text("Vehicle details", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              iconColor: onbordingBlue,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: notifire.getborderColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 40,
                            width: Get.size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  index.isEven ? "Mack" : "Model",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyMedium,
                                    fontSize: 14,
                                    color: greyScale1,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  index.isEven ? "Audi" : "Q7 Quattro",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 15,
                                    color: notifire.getwhiteblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              collapsedIconColor: notifire.getwhiteblackcolor,
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              iconColor: onbordingBlue,
              title: Text(
                "Steering",
                style: TextStyle(
                  fontFamily: FontFamily.gilroyBold,
                  color: notifire.getwhiteblackcolor,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              collapsedIconColor: notifire.getwhiteblackcolor,
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              iconColor: onbordingBlue,
              title: Text(
                "Vehicle Conditions",
                style: TextStyle(
                  fontFamily: FontFamily.gilroyBold,
                  color: notifire.getwhiteblackcolor,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  featuresWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Key specs of Audi Q7", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, color: notifire.getwhiteblackcolor,),),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  width: 140,
                  margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Image.asset("assets/engine.png", height: 25, width: 25,),
                      ),
                      Spacer(),
                      Text("Engine displacement", style: TextStyle(color: greyScale1, fontFamily: FontFamily.gilroyMedium, fontSize: 12,),),
                      SizedBox(height: 5,),
                      Text("2998 cc", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                      SizedBox(height: 8,),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: notifire.getborderColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          Text("Performance", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, color: notifire.getwhiteblackcolor,),),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  width: 140,
                  margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Image.asset(
                          "assets/dashboard.png",
                          height: 25,
                          width: 25,
                          color: greyScale1,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Torque",
                        style: TextStyle(
                          color: greyScale1,
                          fontFamily: FontFamily.gilroyMedium,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "369 lb - ft",
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          color: notifire.getwhiteblackcolor,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: notifire.getborderColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            ),
          ),
          Text(
            "Notable features",
            style: TextStyle(
              fontFamily: FontFamily.gilroyBold,
              fontSize: 16,
              color: notifire.getwhiteblackcolor,
            ),
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 50,
                    width: Get.size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/bluetooth.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Bluetooth connectivity",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            fontSize: 15,
                            color: notifire.getwhiteblackcolor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Yes",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyMedium,
                            color: greenColor,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: greyScale,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  designWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Powerful and sporty - The exterior", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, color: notifire.getwhiteblackcolor,),),
          SizedBox(height: 10,),
          Text("For an even sportier look, opt for optional Design Packages.", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 14,),),
          SizedBox(height: 10,),
          Container(
            height: 180,
            width: Get.size.width,
            child: Image.asset("assets/Image.png", fit: BoxFit.fill,),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

  priceMapWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product historical data", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(11),
                      child: Image.asset("assets/dollar-circle.png"),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$75,340.00", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, color: notifire.getwhiteblackcolor,),),
                          SizedBox(height: 5,),
                          Text("Average sale", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 12,),),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: notifire.getborderColor),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  reviewsWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 144,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: notifire.getblackwhitecolor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: '5.0', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 32, fontWeight: FontWeight.w700, color:  greyScale1)),
                              TextSpan(text: '/5', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 16, fontWeight: FontWeight.w500, color: greyScale1)),
                            ],
                      )),
                      Text('23 Rating * 15 Reviews', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, fontWeight: FontWeight.w700, color: greyScale1)),
                      star(),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 30,top: 15),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: text.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Transform.translate(
                              offset: Offset(0, -5),
                                child: Text(text[index], style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 10, fontWeight: FontWeight.w500, color: greyScale1))),
                            SizedBox(width: 20,),
                            Container(
                              height: 7,
                              width: 90,
                              margin: EdgeInsets.only(bottom: 13),
                              decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Text('User review', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor)),
          SizedBox(height: 15,),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                height: 180,
                width: Get.width,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(backgroundImage: AssetImage('assets/artist-1 1.png')),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Alon musk', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor)),
                              Text('2 days ago', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, fontWeight: FontWeight.w500, color: greyScale)),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.star, color: Colors.amber,),
                          Text('5.0', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor)),
                        ],
                      ),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, fontWeight: FontWeight.w500, color: greyScale1)),
                      Row(
                        children: [
                          Image.asset('assets/like.png', height: 20, width: 20,),
                          SizedBox(width: 10,),
                          Text('100', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, fontWeight: FontWeight.w500, color: greyScale1)),
                          SizedBox(width: 15,),
                          Image.asset('assets/dislike.png', height: 20, width: 20,),
                          SizedBox(width: 10,),
                          Text('12', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, fontWeight: FontWeight.w500, color: greyScale1)),
                          Spacer(),
                          Image.asset('assets/share-two.png', height: 20, width: 20,),
                        ],
                      ),
                    ],
                  ),
                ),
              );
          },),
        ],
      ),
    );
  }
}
Widget star(){
  return Row(
    children: [
      Icon(Icons.star, color: Colors.amber,),
      Icon(Icons.star, color: Colors.amber,),
      Icon(Icons.star, color: Colors.amber,),
      Icon(Icons.star, color: Colors.amber,),
      Icon(Icons.star, color: Colors.amber,),
    ],
  );
}