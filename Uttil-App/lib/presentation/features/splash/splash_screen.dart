import 'dart:async';
import 'package:uttil/core/constants/App_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:uttil/presentation/features/onboarding/onboarding_screen.dart';
import 'package:uttil/core/utils/Dark_lightmode.dart';
import 'package:uttil/core/utils/fontfameli_model.dart';
import 'package:uttil/core/constants/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
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
    getLocationPermission();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  getLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
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
              Appcontent.sLogo,
              height: 68,
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'U',
                    style: TextStyle(
                      fontFamily: FontFamily.lABGrotesk,
                      fontSize: 39,
                      color: notifire.getwhiteblackcolor,
                      letterSpacing: -5,
                    ),
                  ),
                  TextSpan(
                    text: 'ttil',
                    style: TextStyle(
                      fontFamily: FontFamily.nebulasMedium,
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
