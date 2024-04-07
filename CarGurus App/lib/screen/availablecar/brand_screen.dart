import 'package:carguru/screen/detailcar/cardetails_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../controller/favorite_controller.dart';
import '../../utils/Colors.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  FavoriteController favoriteController = Get.find();
  bool selectIndex = true;
  late ColorNotifire notifire;
  List text = [
    'RS5 Coupe',
    'A7',
    'R8 Coupe',
    'R8 RWD',
  ];
  List title = [
    'RS 4 Advant',
    'A5 Coupe',
    'A6 Saloon',
    'A7 Sportback',
    'R8 Coupe',
  ];
  List subtitle = [
    '9 Units',
    '5 Units',
    'Out of Stock',
    '10 Units',
    'Out of Stock',
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(Appcontent.back, height: 24, width: 24 ,color: notifire.getwhiteblackcolor,)),
        ),
        title: Text('Audi', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor,),),
        centerTitle: true,
        actions: [
          Image.asset(Appcontent.filter, height: 24, width: 24 ,color: notifire.getwhiteblackcolor,),
          const SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: notifire.getblackwhitecolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: notifire.getbgcolor),
                    ),
                    hintText: 'Search brand, or model...',
                    hintStyle: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 16, color: notifire.getwhiteblackcolor),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Appcontent.search, height: 24, width: 24,color: notifire.getwhiteblackcolor),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Text('Models', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                trailing: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: notifire.getbgcolor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 701,
                            width: Get.width,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text('Models', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                                    trailing: GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                        child: Icon(Icons.close, size: 24, color: notifire.getwhiteblackcolor,)),
                                  ),
                                  ListView.builder(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    itemBuilder: (context, index) {
                                      return favoriteController.isLoading
                                          ? GestureDetector(
                                               onTap: () {},
                                               child: Container(
                                                 height: 80,
                                                 width: Get.size.width,
                                                 margin: const EdgeInsets.symmetric(vertical: 10),
                                                 decoration: BoxDecoration(
                                                   border: Border.all(color: notifire.getborderColor),
                                                   color: notifire.getblackwhitecolor,
                                                   borderRadius: BorderRadius.circular(15),
                                                 ),
                                                 child: ListTile(
                                                   leading: Image.asset('assets/modelcar.png', height: 98,),
                                                   title: Text(title[index], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'gilroyBold', color: notifire.getwhiteblackcolor),),
                                                   subtitle: Text(subtitle[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'gilroyMedium', color: greyScale),),
                                                   trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: notifire.getwhiteblackcolor,),
                                                 ),
                                               ),
                                      ) : const SizedBox();
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                    );
                  },
                    child: Text('View all', style: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 14, color: notifire.getblackgreycolor,),)),
              ),
              SizedBox(
                height: 88,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: text.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(const CarDetailsScreen());
                      },
                      child: Container(
                        height: 88,
                        width: 96,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: notifire.getborderColor, width: 1)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(Appcontent.porche),
                            Text(text[index], style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 12, color: notifire.getwhiteblackcolor,),),
                          ],
                        ),
                      ),
                    );
                },),
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Text('Available cars Audi', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                  const Expanded(child: SizedBox(width: 10,)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = true;
                      });
                    },
                    child: Image.asset(Appcontent.layoutlist, height: 20, width: 20, color: selectIndex ? Colors.purple : Colors.grey,),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = false;
                      });
                    },
                    child: Image.asset(Appcontent.layoutgrid, height: 20, width: 20, color: selectIndex  ? Colors.grey : Colors.purple,),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              selectIndex ? ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return favoriteController.isLoading
                      ? GestureDetector(
                          onTap: () {
                            Get.to(const CarDetailsScreen());
                          },
                          child: Container(
                            height: 160,
                            width: Get.size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: notifire.getborderColor),
                              color: notifire.getblackwhitecolor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 140,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/jeep.png'),),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Jeep Rubicon", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
                                          const SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Jeep", style: TextStyle(fontFamily:FontFamily.gilroyBold, fontSize: 15, color: greyScale,),),
                                              const Spacer(),
                                              Image.asset("assets/star.png", height: 16, width: 16,),
                                              Text("5.0", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 13,),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                          const SizedBox(height: 4,),
                          Divider(color: greyScale,),
                          const SizedBox(height: 4,),
                          Row(
                            children: [
                              Image.asset("assets/engine.png", height: 20, width: 20,),
                              const SizedBox(width: 4,),
                              Text("540 hp", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 13,),),
                              const SizedBox(width: 10,),
                              Image.asset("assets/manual-gearbox.png", height: 20, width: 20,),
                              const SizedBox(width: 4,),
                              Text("Automatic", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 13,),),
                              const Spacer(),
                              Text("\$176,037.11", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 15,),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ) : const SizedBox();
                },
              ) : GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisExtent: 180),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return favoriteController.isLoading
                        ? GestureDetector(
                         onTap: () {
                           Get.to(const CarDetailsScreen());
                         },
                         child: Container(
                           height: 180,
                           width: Get.size.width,
                           padding: const EdgeInsets.symmetric(horizontal: 15),
                           margin: const EdgeInsets.symmetric(vertical: 8),
                           decoration: BoxDecoration(
                             border: Border.all(color: notifire.getborderColor),
                             color: notifire.getblackwhitecolor,
                             borderRadius: BorderRadius.circular(15),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const SizedBox(height: 5,),
                               Row(
                                 children: [
                                   Text("Jeep", style: TextStyle(fontFamily:FontFamily.gilroyBold, fontSize: 15, color: greyScale,),),
                                   const Spacer(),
                                   Image.asset("assets/star.png", height: 16, width: 16,),
                                   Text("5.0", style: TextStyle(fontFamily: FontFamily.gilroyMedium, color: greyScale, fontSize: 13,),),
                                 ],
                               ),
                               Container(
                                 height: 90,
                                 width: 124,
                                 decoration: const BoxDecoration(
                                   image: DecorationImage(image: AssetImage('assets/jeep.png'),),
                                 ),
                               ),
                               Text("Jeep Rubicon", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: notifire.getwhiteblackcolor,),),
                               const Text("\$75,500.00", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: Color(0xff4038FF),),),
                             ],
                           ),
                         ),
                    ) : const SizedBox();
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
