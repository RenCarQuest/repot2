// ignore_for_file: prefer_const_constructors

import 'package:carguru/controller/signup_controller.dart';
import 'package:carguru/helpar/routes_helper.dart';
import 'package:carguru/screen/login_flow/login_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    child: Image.asset(Appcontent.close, color: notifire.getwhiteblackcolor,),
                  ),
                ),
                SizedBox(
                  height: Get.size.height * 0.03,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up".tr,
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: notifire.getwhiteblackcolor,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                          height: Get.size.height * 0.04,
                        ),
                        textFormFild(
                          notifire,
                          controller: signUpController.name,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/user.png",
                              height: 25,
                              width: 25,
                              color: greyColor,
                            ),
                          ),
                          labelText: "Fullname".tr,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        textFormFild(
                          notifire,
                          controller: signUpController.emali,
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
                        SizedBox(
                          height: 15,
                        ),
                        GetBuilder<SignUpController>(builder: (context) {
                          return textFormFild(
                            notifire,
                            controller: signUpController.password,
                            obscureText: signUpController.showPassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                signUpController.showOfPassword();
                              },
                              child: !signUpController.showPassword
                                  ? Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/eye.png",
                                        height: 25,
                                        width: 25,
                                        color: greyColor,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/eye-off.png",
                                        height: 25,
                                        width: 25,
                                        color: greyColor,
                                      ),
                                    ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/lock.png",
                                height: 25,
                                width: 25,
                                color: greyColor,
                              ),
                            ),
                            labelText: "Password".tr,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password'.tr;
                              }
                              return null;
                            },
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "By signing up, you agree to our",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Terms of",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyBold,
                                color: onbordingBlue,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Service",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyBold,
                                color: onbordingBlue,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "and",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Privacy Policy.",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyBold,
                                color: onbordingBlue,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.size.height * 0.03,
                        ),
                        GestButton(
                          height: 50,
                          Width: Get.size.width,
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          buttoncolor: onbordingBlue,
                          buttontext: "Sign In",
                          style: TextStyle(
                            color: WhiteColor,
                            fontFamily: FontFamily.gilroyBold,
                            fontSize: 15,
                          ),
                          onclick: () {
                            Get.toNamed(Routes.otpScreen, arguments: {
                              "route": "signUpScreen",
                            });
                            if (_formKey.currentState?.validate() ?? false) {}
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        imageButton(
                          height: 50,
                          width: Get.size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          image: "assets/google.png",
                          buttonText: "Continue with Google",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyMedium,
                            color: notifire.getwhiteblackcolor,
                            fontSize: 15,
                          ),
                          border: Border.all(color: notifire.getborderColor),
                          color: notifire.getblackwhitecolor,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        imageButton(
                          height: 50,
                          width: Get.size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          image: notifire.isDark
                              ? "assets/apple.png"
                              : "assets/darkapple.png",
                          buttonText: "Continue with Apple",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyMedium,
                            color: notifire.getwhiteblackcolor,
                            fontSize: 15,
                          ),
                          border: Border.all(color: notifire.getborderColor),
                          color: notifire.getblackwhitecolor,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: Get.size.height * 0.10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Already have and account?",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyBold,
                                  color: onbordingBlue,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
