// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, sort_child_properties_last
import 'package:carguru/screen/login_flow/newpassword_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String rout = Get.arguments["route"];
  TextEditingController pinPutController = TextEditingController();
  String code = "";

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
      bottomNavigationBar: SizedBox(
        height: 135,
        width: Get.size.width,
        child: Column(
          children: [
            GestButton(
              height: 50,
              Width: Get.size.width,
              buttoncolor: onbordingBlue,
              buttontext: "Continue",
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: WhiteColor,
                fontSize: 15,
              ),
              onclick: () {
                if (rout == "signUpScreen") {
                  Get.to(NewPasswordScreen());
                } else if (rout == "resetScreen") {
                  Get.to(NewPasswordScreen());
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            NormalButton(
              height: 50,
              width: Get.size.width,
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              buttonText: "Resend Code",
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: onbordingBlue,
                fontSize: 15,
              ),
              border: Border.all(color: onbordingBlue),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(6),
                  child: Image.asset(Appcontent.close, color: notifire.getwhiteblackcolor,),
                ),
              ),
              SizedBox(height: Get.size.height * 0.04,),
              Container(
                height: 100,
                width: Get.size.width,
                alignment: Alignment.center,
                child: Image.asset(Appcontent.ematy),
              ),
              SizedBox(height: 10,),
              Container(
                width: Get.size.width,
                alignment: Alignment.center,
                child: Text(
                  "Almost there!",
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
                  "Check your email inbox and input the \n verification code to verify your account.",
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
              Container(
                alignment: Alignment.center,
                child: PinCodeTextField(
                  appContext: context,
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  cursorColor: onbordingBlue,
                  cursorHeight: 18,
                  enablePinAutofill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    inactiveColor: greyScale,
                    activeColor: onbordingBlue,
                    selectedColor: onbordingBlue,
                    activeFillColor: notifire.getbgcolor,
                    inactiveFillColor: notifire.getbgcolor,
                    selectedFillColor: notifire.getbgcolor,
                    borderWidth: 1,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: notifire.getbgcolor,
                  enableActiveFill: true,
                  controller: pinPutController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your otp'.tr;
                    }
                    return null;
                  },
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    code = value;
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
