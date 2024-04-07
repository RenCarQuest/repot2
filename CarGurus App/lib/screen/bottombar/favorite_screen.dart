// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:carguru/controller/favorite_controller.dart';
import 'package:carguru/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteController favoriteController = Get.find();
  SingingCharacter? _character = SingingCharacter.a;

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
    favoriteController.changShimmer();
  }

  List text = [
    'Latest saved',
    'Longest saved',
    'Most reviews',
    'Highest price',
    'Lowest price',
  ];

  int value = 0;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Text("Favorites", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
        actions: [
          Icon(Icons.more_vert, color: notifire.getwhiteblackcolor,),
          SizedBox(width: 15,),
        ],
      ),
      body: GetBuilder<FavoriteController>(builder: (favoriteController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("10 cars", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: notifire.getbgcolor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return SizedBox(
                                height: 437,
                                width: Get.width,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: ListTile(
                                        leading: Text('Sort by', style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
                                        trailing: InkWell(
                                          onTap: () => Get.back(),
                                          child: Icon(Icons.close, color: greyScale,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _character = SingingCharacter.a;
                                        });
                                      },
                                      child: ListTile(
                                        leading: Text(text[0], style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                        trailing: Radio(
                                          activeColor: onbordingBlue,
                                          value: SingingCharacter.a,
                                          groupValue: _character,
                                          onChanged: (value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _character = SingingCharacter.b;
                                        });
                                      },
                                      child: ListTile(
                                        leading: Text(text[1], style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                        trailing: Radio(
                                          activeColor: onbordingBlue,
                                          value: SingingCharacter.b,
                                          groupValue: _character,
                                          onChanged: (value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _character = SingingCharacter.c;
                                        });
                                      },
                                      child: ListTile(
                                        leading: Text(text[2], style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                        trailing: Radio(
                                          activeColor: onbordingBlue,
                                          value: SingingCharacter.c,
                                          groupValue: _character,
                                          onChanged: (value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _character = SingingCharacter.d;
                                        });
                                      },
                                      child: ListTile(
                                        leading: Text(text[3], style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                        trailing: Radio(
                                          activeColor: onbordingBlue,
                                          value: SingingCharacter.d,
                                          groupValue: _character,
                                          onChanged: (value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _character = SingingCharacter.e;
                                        });
                                      },
                                      child: ListTile(
                                        leading: Text(text[4], style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                        trailing: Radio(
                                          activeColor: onbordingBlue,
                                          value: SingingCharacter.e,
                                          groupValue: _character,
                                          onChanged: (value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },

                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Text("Sort", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 14,),),
                        SizedBox(width: 5,),
                        Image.asset("assets/sort-descending.png", height: 25, width: 25,),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return favoriteController.isLoading
                        ? GestureDetector(
                           onTap: () {
                             Get.to(CarDetailsScreen());
                           },
                          child: Container(
                              height: 270,
                              width: Get.size.width,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        alignment: Alignment.center,
                                        child: Text("Free test drive", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor,),),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: onbordingBlue,
                                        ),
                                      ),
                                      Spacer(),
                                      Image.asset("assets/favorite.png", height: 28, width: 28,),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Container(
                                    height: 110,
                                    width: Get.size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("assets/car1.png"),),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text("Audi R8 Performance RWD", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
                                      ),
                                      SizedBox(width: 5,),
                                      Image.asset("assets/star.png", height: 16, width: 16,),
                                      SizedBox(width: 2,),
                                      Text("4.8", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 14,),),
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Divider(color: greyScale,),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Image.asset("assets/engine.png", height: 20, width: 20,),
                                      SizedBox(width: 4,),
                                      Text("540 hp", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 13,),),
                                      SizedBox(width: 10,),
                                      Image.asset("assets/manual-gearbox.png", height: 20, width: 20,),
                                      SizedBox(width: 4,),
                                      Text("Automatic", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale1, fontSize: 13,),),
                                      Spacer(),
                                      Text("\$176,037.11", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                                    ],
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: notifire.getborderColor),
                                borderRadius: BorderRadius.circular(20),
                                color: notifire.getblackwhitecolor,
                              ),
                            ),
                        )
                        : carRecomendationShimmer(notifire);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
enum SingingCharacter {a, b, c, d, e}
