// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_element, sort_child_properties_last
import 'dart:async';
import 'package:carguru/screen/login_flow/login_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
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
    getLocationPermition();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BordingScreen(),),);
    });
  }

  getLocationPermition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {}
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.getbgcolor,
        body: Container(
          height: Get.size.height,
          width: Get.size.width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/sLogo.png', height: 68,),
              SizedBox(height: 15),
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: 'Car', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 39, color: notifire.getwhiteblackcolor, letterSpacing: 1,),),
                  TextSpan(text: 'Guru.', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 39, color: onbordingBlue, letterSpacing: 1,),),
                ],
              )),
            ],
          ),
        ));
  }
}

class BordingScreen extends StatefulWidget {
  const BordingScreen({super.key});

  @override
  State<BordingScreen> createState() => _BordingScreenState();
}

class _BordingScreenState extends State<BordingScreen> {
  int index = 0;

  PageController pageController = PageController();

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

  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < 3; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != 3 - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(const SizedBox(
          width: 10,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == this.index ? 30 : 8,
      height: index == this.index ? 7 : 8,
      decoration: BoxDecoration(
          color: index == this.index ? WhiteColor : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: Stack(
        children: [
          Container(
            height: Get.size.height,
            width: Get.size.width,
            color: index == 0 ? BlackColor : onbordingBlue,
            child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      index == 2 ? EdgeInsets.only(left: 20) : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(index == 0 ? Appcontent.onbording1 : index == 1 ? Appcontent.onbording2 : Appcontent.onbording3,), fit: index == 0 ? BoxFit.cover : null,),
                  ),
                );
              },
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
            ),
          ),
          index != 2
              ? Positioned(
                  top: Get.size.height * 0.06,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      _buildPageIndicator(),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            pageController.jumpToPage(2);
                          });
                        },
                        child: Text(
                          "Skip".tr,
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyMedium,
                            color: index == 0 ? onbordingBlue : WhiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          Positioned(
            top: Get.size.height * 0.12,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      index == 0
                          ? "Your key to hassle-\nfree car shopping".tr
                          : index == 1
                              ? "Revolutionize your car\nbuying experience".tr
                              : "Let’s get started".tr,
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyBold,
                        color: WhiteColor,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      index == 0
                          ? "You choose your car online. We inspect\nit and deliver it."
                              .tr
                          : index == 1
                              ? "Answer a few quick questions to find\nthe right car for you."
                                  .tr
                              : "Sign up or login to see what\nhappening near you",
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyScale,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          index == 2
              ? Positioned(
                  top: Get.size.height * 0.08,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/whitecar.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "CarGuru".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 32,
                          color: WhiteColor,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Container(
              child: index == 0
                  ? Column(
                      children: [
                        GestButton(
                          height: 50,
                          Width: Get.size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          buttoncolor: onbordingBlue,
                          buttontext: "Get Started",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: WhiteColor,
                            fontSize: 15,
                          ),
                          onclick: () {
                            pageController.jumpToPage(1);
                          },
                        ),
                      ],
                    )
                  : index == 1
                      ? Column(
                          children: [
                            GestButton(
                              height: 50,
                              Width: Get.size.width,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              buttoncolor: WhiteColor,
                              buttontext: "Get Started",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyBold,
                                color: onbordingBlue,
                                fontSize: 15,
                              ),
                              onclick: () {
                                pageController.jumpToPage(2);
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            GestButton(
                              height: 50,
                              Width: Get.size.width,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              buttoncolor: WhiteColor,
                              buttontext: "Continue with Email",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyBold,
                                color: onbordingBlue,
                                fontSize: 15,
                              ),
                              onclick: () {
                                Get.to(LoginScreen());
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            imageButton(
                              height: 50,
                              width: Get.size.width,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              image: "assets/google.png",
                              buttonText: "Continue with Google",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                color: WhiteColor,
                                fontSize: 15,
                              ),
                              border: Border.all(color: grey50),
                              onTap: () {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            imageButton(
                              height: 50,
                              width: Get.size.width,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              image: "assets/apple.png",
                              buttonText: "Continue with Apple",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                color: WhiteColor,
                                fontSize: 15,
                              ),
                              border: Border.all(color: grey50),
                              onTap: () {},
                            ),
                          ],
                        ),
            ),
          )
        ],
      ),
    );
  }
}
