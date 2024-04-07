// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unused_local_variable

import 'package:carguru/helpar/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLocationController extends GetxController implements GetxService {
  TextEditingController completeAddress = TextEditingController();
  TextEditingController landMark = TextEditingController();
  TextEditingController reach = TextEditingController();
  TextEditingController homeAddress = TextEditingController();

  var lat;
  var long;
  var address;
  getCurrentLatAndLong(double latitude, double longitude) {
    lat = latitude;
    long = longitude;
    Get.toNamed(Routes.deliveryaddress2);
    update();
  }
}
