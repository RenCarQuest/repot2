// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:carguru/screen/detailcar/address_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderSummeryScreen extends StatefulWidget {
  const OrderSummeryScreen({super.key});

  @override
  State<OrderSummeryScreen> createState() => _OrderSummeryScreenState();
}

class _OrderSummeryScreenState extends State<OrderSummeryScreen> {
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
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(12),
            child: Image.asset("assets/back.png", color: notifire.getwhiteblackcolor,),
          ),
        ),
        centerTitle: true,
        title: Text("Inspection & Delivery", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
      ),
      bottomNavigationBar: GestButton(
        height: 50,
        Width: Get.size.width,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        buttontext: "Continue",
        style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 15,),
        buttoncolor: onbordingBlue,
        onclick: () {
          Get.to(AddressScreen());
        },
      ),
      body: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Vehicle inspection", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset("assets/question-circle.png", height: 25, width: 25,),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 220,
                  width: Get.size.width,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          'Initial Price',
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: WhiteColor,
                            fontSize: 12,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: onbordingBlue,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "\$80,063.00",
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 22,
                          color: notifire.getwhiteblackcolor,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Image.asset("assets/shield-check.png", height: 20, width: 20,),
                          Spacer(),
                          Text("Money-back guarantee if the car fails the\ninspection.", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: Color(0xFF22C55E), fontSize: 14,),),
                          Spacer(),
                        ],
                      ),
                     Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: greyScale,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Text("See details", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
                          Spacer(),
                          Image.asset("assets/chevron-right.png", height: 25, width: 25, color: notifire.getwhiteblackcolor,),
                          SizedBox(width: 15,),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: notifire.getborderColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Shipping address",
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyBold,
                        fontSize: 16,
                        color: notifire.getwhiteblackcolor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyBold,
                        fontSize: 16,
                        color: onbordingBlue,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: grey50,
                ),
                SizedBox(
                  height: 10,
                ),
                detailsRow(
                  title: "Name",
                  subTitle: "Saski Ropokova",
                  color: notifire.getwhiteblackcolor,
                ),
                SizedBox(
                  height: 10,
                ),
                detailsRow(
                  title: "Street",
                  subTitle: "Jackson Street 1314",
                  color: notifire.getwhiteblackcolor,
                ),
                SizedBox(
                  height: 10,
                ),
                detailsRow(
                  title: "Phone number",
                  subTitle: "+1 234 567 00",
                  color: notifire.getwhiteblackcolor,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Order summary",
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyBold,
                      color: notifire.getwhiteblackcolor,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    color: grey50,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: detailsRow(
                    title: "Car Audit",
                    subTitle: "\$80,063.00",
                    color: notifire.getwhiteblackcolor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: detailsRow(
                    title: "Total",
                    subTitle: "\$80,063.00",
                    color: onbordingBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  detailsRow({String? title, subTitle, Color? color}) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          title ?? "",
          style: TextStyle(
            fontFamily: FontFamily.gilroyMedium,
            fontSize: 15,
            color: greyScale1,
          ),
        ),
        Spacer(),
        Text(
          subTitle ?? "",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 15,
            color: color,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
