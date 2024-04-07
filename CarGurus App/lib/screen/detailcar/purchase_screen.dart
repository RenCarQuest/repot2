// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:carguru/controller/carpurchase_controller.dart';
import 'package:carguru/screen/detailcar/credit_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ordersummery_screen.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  CarPurchaseController carPurchaseController = Get.find();

  List<String> carguruList = [
    "Fixed Price, No Hidden Fees",
    "Proof of car insurance",
    "Proof of address, as recent as 30 days",
    "any additional owners present",
  ];

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
        title: Text("Purchase method", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
      ),
      bottomNavigationBar: GestButton(
        height: 50,
        Width: Get.size.width,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        buttontext: "Select Delivery Address",
        buttoncolor: onbordingBlue,
        style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 15,),
        onclick: () {
          carPurchaseController.currentIndex == 0 ? Get.to(CreditScreen()) : carPurchaseController.currentIndex == 1 ? Get.to(OrderSummeryScreen()) : Get.to(CreditScreen());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 130,
                  width: Get.size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Image.asset("assets/Audi.png", height: 25, width: 50, color: onbordingBlue,),
                            SizedBox(height: 5),
                            Text("Audi Q7 50 Quattro", maxLines: 1, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, overflow: TextOverflow.ellipsis, color: notifire.getwhiteblackcolor,),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Image.asset("assets/engine.png", height: 20, width: 20,),
                                SizedBox(width: 4,),
                                Text("335 hp", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 13,),),
                                SizedBox(width: 10,),
                                Image.asset("assets/manual-gearbox.png", height: 20, width: 20,),
                                SizedBox(width: 4,),
                                Text("Automatic", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 13,),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: Get.size.width * 0.35,
                        padding: EdgeInsets.all(2),
                        child: Image.asset("assets/Imageaudi.png"),
                      ),
                    ],
                  ),
                ),
                Divider(color: grey50),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Your purchase method", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                    SizedBox(width: 8),
                    Image.asset("assets/question-circle.png", height: 20, width: 20,),
                  ],
                ),
                SizedBox(height: 8,),
                GetBuilder<CarPurchaseController>(builder: (context) {
                  return ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          carPurchaseController.changeIndexInYourPurchase(index: index,);
                        },
                        child: Container(
                          height: 80,
                          width: Get.size.width,
                          margin: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  index == 0 ? "assets/card.png" : index == 1 ? "assets/dollar-circle.png" : "assets/card.png",
                                  color: carPurchaseController.currentIndex == index ? WhiteColor : notifire.getwhiteblackcolor,
                                  height: 25,
                                  width: 25,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: carPurchaseController.currentIndex == index ? Color(0xFF534CFF) : notifire.getblackwhitecolor,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      index == 0 ? "Cash" : index == 1 ?  "Payment full" : "Financing",
                                      maxLines: 1,
                                      style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: carPurchaseController.currentIndex == index ? WhiteColor : notifire.getwhiteblackcolor, overflow: TextOverflow.ellipsis,),
                                    ),
                                    SizedBox(height: 4,),
                                    Text(index == 0 ? "Everything simply at visit, approval \n within 30 minutes" : "Everything simply online, approval \n within 30 minutes", maxLines: 2, style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 12, overflow: TextOverflow.ellipsis,),),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 25,
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(width: 1.0, color: grey50,),
                                  ),
                                  visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                                  checkColor: WhiteColor,
                                  activeColor: onbordingBlue,
                                  value: carPurchaseController.currentIndex == index ? true : false,
                                  onChanged: (value) {},
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: carPurchaseController.currentIndex == index ? onbordingBlue : notifire.getborderColor),
                            borderRadius: BorderRadius.circular(15),
                            color: carPurchaseController.currentIndex == index ? onbordingBlue : notifire.getblackwhitecolor,
                          ),
                        ),
                      );
                    },
                  );
                }),
                SizedBox(height: 10),
                Container(
                  height: 178,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: notifire.getblackwhitecolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Carguru promise", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                        ListView.builder(
                          itemCount: carguruList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    alignment: Alignment.center,
                                    child: Image.asset("assets/circle-check.png",),
                                  ),
                                  SizedBox(width: 10),
                                  Text(carguruList[index], style: TextStyle(color: notifire.getwhiteblackcolor, fontFamily: FontFamily.gilroyMedium,),),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
