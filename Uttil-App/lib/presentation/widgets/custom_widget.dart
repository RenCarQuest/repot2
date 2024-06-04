// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sort_child_properties_last

import '../../core/constants/Colors.dart';
import '../../core/utils/Dark_lightmode.dart';
import '../../core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

GestButton({
  String? buttontext,
  Function()? onclick,
  double? Width,
  double? height,
  Color? buttoncolor,
  EdgeInsets? margin,
  TextStyle? style,
}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      height: height,
      width: Width,
      // margin: EdgeInsets.only(top: 15, left: 30, right: 30),
      margin: margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: buttoncolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(
              0.5,
              0.5,
            ),
            blurRadius: 1,
          ), //BoxShadow
        ],
      ),
      child: Text(buttontext!, style: style),
    ),
  );
}

imageButton({
  double? width,
  double? height,
  EdgeInsetsGeometry? margin,
  double? spacing,
  String? image,
  String? buttonText,
  TextStyle? style,
  BoxBorder? border,
  Color? color,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: margin,
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image ?? ""),
              ),
            ),
          ),
          SizedBox(
            width: spacing ?? 40,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              buttonText ?? "",
              style: style,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: border,
        color: color,
      ),
    ),
  );
}

NormalButton({
  double? width,
  double? height,
  EdgeInsetsGeometry? margin,
  String? buttonText,
  TextStyle? style,
  BoxBorder? border,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      alignment: Alignment.center,
      child: Text(
        buttonText ?? "",
        style: style,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: border,
      ),
    ),
  );
}

textFormFild(
  ColorNotifire notifire, {
  TextEditingController? controller,
  bool? obscureText,
  TextInputAction? textInputAction,
  Widget? suffixIcon,
  Widget? prefixIcon,
  String? labelText,
  String? Function(String?)? validator,
  void Function(String)? onFieldSubmitted,
  TextInputType? keyboardType
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: notifire.getblackwhitecolor),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: accent,
      style: TextStyle(
        fontFamily: FontFamily.dMSans,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: notifire.getwhiteblackcolor,
      ),
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: accent),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: notifire.getborderColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: notifire.getborderColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: TextStyle(
          color: customGrey,
          fontFamily: FontFamily.dMSans,
        ),
      ),
    ),
  );
}

showToastMessage(message) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: BlackColor.withOpacity(0.9),
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

carRecomendationShimmer(ColorNotifire notifire) {
  return Container(
    height: 280,
    width: Get.size.width,
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Shimmer.fromColors(
      baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
      highlightColor: notifire.isDark ? Color(0xFF475569) : Color(0xFFeaeff4),
      enabled: true,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 100,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 110,
            width: Get.size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: notifire.getblackwhitecolor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
              Spacer(),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: greyScale,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
              Spacer(),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getblackwhitecolor,
                ),
              ),
            ],
          )
        ],
      ),
    ),
    decoration: BoxDecoration(
      border: Border.all(color: notifire.getborderColor),
      borderRadius: BorderRadius.circular(20),
      color: notifire.getblackwhitecolor,
    ),
  );
}
