// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:carguru/model/model.dart';
import 'package:carguru/presentation/features/screen/appointment/appointment_screen.dart';
import 'package:carguru/presentation/features/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/presentation/features/screen/mypurchases/mypurchases_screen.dart';
import 'package:carguru/presentation/features/screen/testdrive/testdrive_screen.dart';
import 'package:carguru/presentation/features/screen/testdrive/vouchers_screen.dart';
import 'package:carguru/presentation/features/settings_screen/editprofile_screen.dart';
import 'package:carguru/presentation/features/settings_screen/settings_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../controller/favorite_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isdark = false;
  late ColorNotifire notifire;
  FavoriteController favoriteController = Get.find();
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
        backgroundColor: onbordingBlue,
        centerTitle: true,
        elevation: 0,
        leading: Icon(null),
        title: Text("Profile", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 16,),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(SettingsScreen());
            },
              child: Image.asset("assets/settings.png", height: 25, width: 25,)),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.size.height * 0.3,
              width: Get.size.width,
              color: onbordingBlue,
              child: GestureDetector(
                onTap: () {
                  Get.to(EditScreen());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: AssetImage(Appcontent.profile),
                    ),
                    SizedBox(height: 15,),
                    Text("Alon musk", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: WhiteColor,),),
                    SizedBox(height: 5,),
                    Text("Buyer’s Account", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 14, color: greyScale),),
                    Spacer(),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(MyPurchasesScreen());
              },
              child: Container(
                height: 64,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: notifire.getborderColor),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: onbordingBlue,
                      ),
                      child: Center(
                        child: Image.asset(Appcontent.shopping, height: 24, width: 24,),
                      ),
                    ),
                    Text("My purchases", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                    Spacer(),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: notifire.getwhiteblackcolor,
                      ),
                      child: Center(child: Text("1", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: Colors.white,),)),
                    ),
                    SizedBox(width: 15,),
                    Icon(Icons.arrow_forward_ios, color: notifire.getwhiteblackcolor, size: 24,),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text("General", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: greyScale, fontSize: 15,),),
            ),
            SizedBox(height: 10,),
            ListView.builder(
              itemCount: model().imgList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Get.to(AppointmentScreen());
                    } else if (index == 1) {
                      Get.to(TestdriveOrderScreen());
                    } else if (index == 2) {
                      Get.to(VoucherScreen());
                    } else if(index == 3) {
                    } else {
                    }
                  },
                  child: Container(
                    height: 40,
                    width: Get.size.width,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 50,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            model().imgList[index],
                          ),
                        ),
                        Expanded(
                          child: Text(model().profileList[index], maxLines: 1, style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15, overflow: TextOverflow.ellipsis,),),
                        ),
                        Image.asset("assets/chevron-right.png", height: 25, width: 25,),
                      ],
                    ),
                  ),
                );
              },
            ),
            darkModeWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text("Browse history", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
            ),
            SizedBox(
              height: 270,
              width: Get.size.width,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(CarDetailsScreen());
                    },
                    child: Container(
                      height: 270,
                      width: 228,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/Audi.png",
                                height: 15,
                                width: 50,
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/heart.png",
                                height: 25,
                                width: 28,
                              ),
                            ],
                          ),
                          Container(
                            height: 110,
                            width: Get.size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/audiCar.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Audi A8 Quattro",
                                  style: TextStyle(
                                    fontFamily:
                                    FontFamily.gilroyBold,
                                    fontSize: 15,
                                    color: notifire
                                        .getwhiteblackcolor,
                                  ),
                                ),
                              ),
                              Image.asset(
                                "assets/star.png",
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "4.8",
                                style: TextStyle(
                                  fontFamily:
                                  FontFamily.gilroyMedium,
                                  color: greyScale,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: greyScale,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/engine.png",
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Automatic",
                                style: TextStyle(
                                  fontFamily:
                                  FontFamily.gilroyMedium,
                                  color: greyScale,
                                  fontSize: 13,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "\$112,150.00",
                                style: TextStyle(
                                  fontFamily:
                                  FontFamily.gilroyBold,
                                  fontSize: 15,
                                  color: onbordingBlue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: notifire.getborderColor),
                        color: notifire.getblackwhitecolor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget darkModeWidget() {
    return Container(
      height: 40,
      width: Get.size.width,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 50,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            child: Image.asset(
              "assets/moon.png",
            ),
          ),
          Expanded(
            child: Text(
              "Dark Mode".tr,
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                fontSize: 16,
                color: notifire.getwhiteblackcolor,
              ),
            ),
          ),
          Spacer(),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: onbordingBlue,
              value: notifire.isDark,
              onChanged: (value) async {
                setState(() {
                  isdark = value;
                });
                final prefs = await SharedPreferences.getInstance();
                setState(() {
                  notifire.setIsDark = value;
                  prefs.setBool("setIsDark", value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
