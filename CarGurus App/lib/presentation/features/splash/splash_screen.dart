import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:carguru/presentation/features/onboarding/onbording_screen.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:carguru/utils/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
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
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnbordingScreen(),
        ),
      );
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
            Image.asset(
              'assets/sLogo.png',
              height: 68,
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'U',
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyBold,
                      fontSize: 39,
                      color: notifire.getwhiteblackcolor,
                      letterSpacing: 1,
                    ),
                  ),
                  TextSpan(
                    text: 'ttil',
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyBold,
                      fontSize: 39,
                      color: onbordingBlue,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
