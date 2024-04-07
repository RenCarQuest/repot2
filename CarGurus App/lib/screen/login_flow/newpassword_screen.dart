// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:carguru/screen/login_flow/enableface_screen.dart';
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

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool showPassword = true;
  bool newShowPassword = true;

  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
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
      bottomNavigationBar: GestButton(
        height: 50,
        Width: Get.size.width,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        buttontext: "Create New Password".tr,
        style: TextStyle(
          fontFamily: FontFamily.gilroyBold,
          color: WhiteColor,
          fontSize: 15,
        ),
        buttoncolor: onbordingBlue,
        onclick: () {
          // passwordSuccessfullSheet();
          if (_formKey.currentState?.validate() ?? false) {
            if (password.text == newPassword.text) {
              showModalBottomSheet(
                backgroundColor: notifire.getbgcolor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
                context: context,
                builder: (context) {
                return SizedBox(
                  height: 437,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15,),
                      Image.asset(Appcontent.passwordch, height: 96, width: 96,),
                      Text('Password changed!', style: TextStyle(fontSize: 24, fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
                      Column(
                        children: [
                          Text('Awesome. You’re successfully', style: TextStyle(fontSize: 16, fontFamily: 'gilroy-medium', fontWeight: FontWeight.w500, color: greyScale),),
                          Text('updated your password.', style: TextStyle(fontSize: 16, fontFamily: 'gilroy-medium', fontWeight: FontWeight.w500, color: greyScale),),
                        ],
                      ),
                      GestButton(
                        height: 50,
                        Width: Get.size.width,
                        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        buttontext: 'Return to Sign In',
                        style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                        onclick: () {
                          Get.to(Enablefacescreen());
                        },
                        buttoncolor: onbordingBlue,
                      ),
                    ],
                  ),
                );
              },);
            } else {
              showToastMessage("Please Enter Valid Password".tr);
            }
          }
        },
      ),
      body: SafeArea(
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
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
                         Appcontent.back,
                          color: notifire.getwhiteblackcolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.025,
                    ),
                    Text(
                      "Create your\nnew password".tr,
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyBold,
                        color: notifire.getwhiteblackcolor,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Your new password must be different\nfrom previous password."
                          .tr,
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyScale,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    textFormFild(
                      notifire,
                      controller: password,
                      obscureText: showPassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: !showPassword
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textFormFild(
                      notifire,
                      controller: newPassword,
                      obscureText: newShowPassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            newShowPassword = !newShowPassword;
                          });
                        },
                        child: !newShowPassword
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
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    passwordRow(
                      title: "Must not contain your name or email".tr,
                      textColor: Color(0xFF22C55E),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    passwordRow(
                      title: "At least 8 characters".tr,
                      textColor: greyScale,
                      color: greyScale,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    passwordRow(
                      title: "Contains a symbol or a number".tr,
                      textColor: greyScale,
                      color: greyScale,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  passwordRow({
    String? title,
    Color? color,
    Color? textColor,
  }) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          alignment: Alignment.center,
          child: Image.asset("assets/circle-check.png", color: color),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title ?? "",
          style: TextStyle(
            color: textColor,
            fontFamily: FontFamily.gilroyMedium,
          ),
        )
      ],
    );
  }

  passwordSuccessfullSheet() {
    return Get.bottomSheet(
      enableDrag: false,
      Container(
        height: Get.size.height * 0.45,
        width: Get.size.width,
        color: notifire.getbgcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.size.height * 0.035,
            ),
            Image.asset(
              "assets/EmptynewPassword.png",
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Password changed!".tr,
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                fontSize: 23,
                color: notifire.getwhiteblackcolor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Awesome. You’re successfully \n updated your password.".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.gilroyMedium,
                fontSize: 15,
                color: notifire.getwhiteblackcolor,
              ),
            ),
            SizedBox(
              height: Get.size.height * 0.065,
            ),
            GestButton(
              height: 50,
              Width: Get.size.width,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              buttoncolor: onbordingBlue,
              buttontext: "Return to Sign In".tr,
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: WhiteColor,
                fontSize: 15,
              ),
              onclick: () {
                Get.offAll(LoginScreen());
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: notifire.getblackwhitecolor,
        ),
      ),
    );
  }
}
