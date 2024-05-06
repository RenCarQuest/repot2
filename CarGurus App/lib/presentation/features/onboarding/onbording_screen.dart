import 'package:carguru/presentation/features/screen/login_flow/login_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int index = 0;
  final int totalPages = 3;

  PageController pageController = PageController();

  late ColorNotifire notifire;
  getDarkModePreviousState() async {
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
    getDarkModePreviousState();
    super.initState();
  }

  Widget _buildPageIndicator() {
    List<Widget> list = [];
    
    for (int i = 0; i < totalPages; i++) {
      list.add(_buildPageIndicatorItem(i));
      if (i != totalPages - 1) {
        list.add(const SizedBox(width: 10));
      }
    }

    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
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
              physics: const ClampingScrollPhysics(),
              controller: pageController,
              itemCount: totalPages,
              itemBuilder: (context, index) {
                return Container(
                  margin: index == 2
                      ? const EdgeInsets.only(left: 20)
                      : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_backgroundImageName(index)),
                      fit: index == 0 ? BoxFit.cover : null,
                    ),
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
          index != 2 ? _pageIndicatorSection() : const SizedBox(),
          index == 2
              ? Positioned(
                  top: Get.size.height * 0.08,
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/whitecar.png"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Uttil",
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
              : const SizedBox(),
          Positioned(
            top: Get.size.height * 0.12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _titlePage(index),
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyBold,
                      color: WhiteColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _descriptionPage(index),
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
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: _footerSection(index),
          )
        ],
      ),
    );
  }

  Widget _footerSection(int index) {
    switch (index) {
      case 0 || 1:
        return Column(
          children: [
            GestButton(
              height: 50,
              Width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              buttoncolor: index == 0 ? onbordingBlue : WhiteColor,
              buttontext: "Get Started",
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: index == 0 ? WhiteColor : onbordingBlue,
                fontSize: 15,
              ),
              onclick: () {
                pageController.jumpToPage(index + 1);
              },
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            GestButton(
              height: 50,
              Width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              buttoncolor: WhiteColor,
              buttontext: "Continue with Email",
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: onbordingBlue,
                fontSize: 15,
              ),
              onclick: () {
                Get.to(const LoginScreen());
              },
            ),
            const SizedBox(height: 10),
            imageButton(
              height: 50,
              width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
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
            const SizedBox(height: 10),
            imageButton(
              height: 50,
              width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
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
        );
      default:
        return const SizedBox();
    }
  }

  String _descriptionPage(int index) {
    switch (index) {
      case 0:
        return "You choose your car online. We inspect\nit and deliver it.";
      case 1:
        return "Answer a few quick questions to find\nthe right car for you.";
      case 2:
        return "Sign up or login to see what\nhappening near you";
      default:
        return "";
    }
  }

  String _titlePage(int index) {
    switch (index) {
      case 0:
        return "Your key to hassle-\nfree car shopping".tr;
      case 1:
        return "Revolutionize your car\nbuying experience".tr;
      case 2:
        return "Let’s get started".tr;
      default:
        return "";
    }
  }

  String _backgroundImageName(int index) {
    switch (index) {
      case 0:
        return Appcontent.onbording1;
      case 1:
        return Appcontent.onbording2;
      case 2:
        return Appcontent.onbording3;
      default:
        return "";
    }
  }

  Positioned _pageIndicatorSection() {
    return Positioned(
      top: Get.size.height * 0.06,
      left: 0,
      right: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 15),
          _buildPageIndicator(),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                pageController.jumpToPage(totalPages - 1);
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
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
