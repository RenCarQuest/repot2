// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:carguru/helpar/routes_helper.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  String cuntryCode = "";
  final _formKey = GlobalKey<FormState>();

  static String verifay = "";
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
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      bottomNavigationBar: SizedBox(
        height: 135,
        width: Get.size.width,
        child: Column(
          children: [
            GestButton(
              height: 50,
              Width: Get.size.width,
              buttoncolor: onbordingBlue,
              buttontext: "Reset Password".tr,
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: WhiteColor,
                fontSize: 15,
              ),
              onclick: () {
                Get.toNamed(Routes.otpScreen, arguments: {
                  "route": "resetScreen",
                });
                if (_formKey.currentState?.validate() ?? false) {}
              },
            ),
            SizedBox(
              height: 10,
            ),
            NormalButton(
              height: 50,
              width: Get.size.width,
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              buttonText: "Return to Sign In".tr,
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: onbordingBlue,
                fontSize: 15,
              ),
              border: Border.all(color: onbordingBlue),
              onTap: () {
                Get.back();
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(6),
                    child: Image.asset(
                      "assets/x.png",
                      color: notifire.getwhiteblackcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.size.height * 0.04,
                ),
                Container(
                  height: 100,
                  width: Get.size.width,
                  alignment: Alignment.center,
                  child: Image.asset("assets/EmptyPassword.png"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.size.width,
                  alignment: Alignment.center,
                  child: Text(
                    "Can’t sign in?".tr,
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyBold,
                      color: notifire.getwhiteblackcolor,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.size.width,
                  alignment: Alignment.center,
                  child: Text(
                    "Enter the email associated with your \n account, and carguru will send you a link \n to reset your password."
                        .tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyBold,
                      color: greyScale,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.size.height * 0.035,
                ),
                textFormFild(
                  notifire,
                  controller: email,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/mail.png",
                      height: 25,
                      width: 25,
                      color: greyColor,
                    ),
                  ),
                  labelText: "Email".tr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email'.tr;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
