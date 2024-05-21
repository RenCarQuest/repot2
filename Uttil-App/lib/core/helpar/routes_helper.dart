// ignore_for_file: prefer_const_constructors

import '../../presentation/features/screen/addlocation/addressdetails_screen.dart';
import '../../presentation/features/screen/addlocation/deliveryaddress1.dart';
import '../../presentation/features/screen/addlocation/deliveryaddress2.dart';
import '../../presentation/features/screen/login_flow/otp_screen.dart';
import '../../presentation/features/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String initial = "/";
  static String otpScreen = "/otpScreen";
  static String deliveryaddress1 = "/deliveryaddress1";
  static String deliveryaddress2 = "/deliveryaddress2";
  static String addressDetailsScreen = "/addressDetailsScreen";
}

final getPages = [
  GetPage(
    name: Routes.initial,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: Routes.otpScreen,
    page: () => OtpScreen(),
  ),
  GetPage(
    name: Routes.deliveryaddress1,
    page: () => DeliveryAddress1(),
  ),
  GetPage(
    name: Routes.deliveryaddress2,
    page: () => DelieryAddress2(),
  ),
  GetPage(
    name: Routes.addressDetailsScreen,
    page: () => AddressDetailsScreen(),
  ),
];
