// ignore_for_file: prefer_const_constructors

import 'package:carguru/presentation/features/screen/bottombar/favorite_screen.dart';
import 'package:carguru/presentation/features/screen/bottombar/home_screen.dart';
import 'package:carguru/presentation/features/screen/bottombar/message_screen.dart';
import 'package:carguru/presentation/features/screen/bottombar/profile_screen.dart';
import 'package:carguru/core/constants/Colors.dart';
import 'package:carguru/core/utils/Dark_lightmode.dart';
import 'package:carguru/core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  List<Widget> myChilders = [
    HomeScreen(),
    FavoriteScreen(),
    MessageScreen(),
    ProfileScreen(),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: notifire.getbgcolor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: greyScale1,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontFamily: FontFamily.gilroyBold,
          fontSize: 12,
        ),
        fixedColor: onbordingBlue,
        unselectedLabelStyle: const TextStyle(
          fontFamily: FontFamily.gilroyMedium,
        ),
        currentIndex: currentIndex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/homeOutline.png",
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              "assets/images/homeBold.png",
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/favoriteOutline.png",
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              "assets/images/fevoriteBold.png",
              color: onbordingBlue,
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: 'Favorites'.tr,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/messageOutline.png",
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              "assets/images/messageBold.png",
              color: onbordingBlue,
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: 'Message'.tr,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/profileOutline.png",
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              "assets/images/profileBold.png",
              color: onbordingBlue,
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: 'Profile'.tr,
          ),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: myChilders[currentIndex],
    );
  }
}
