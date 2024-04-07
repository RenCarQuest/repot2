// ignore_for_file: non_constant_identifier_names
import 'package:carguru/screen/detailcar/address_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/Custom_widget.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  double _Slider = 20;
  double _Slider1 = 20;
  late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.close),
        ),
        centerTitle: true,
        title: const Text("Credit Simulation", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
      ),
      bottomNavigationBar: GestButton(
        height: 50,
        Width: Get.size.width,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        buttontext: "Apply for financing",
        buttoncolor: onbordingBlue,
        style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 15,),
        onclick: () {
          Get.to(const AddressScreen());
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 688,
              width: Get.width,
              decoration: BoxDecoration(
                color: notifire.getbgcolor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 248,
                    width: Get.width,
                    margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: notifire.getblackwhitecolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Down payment', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor, fontWeight: FontWeight.w700),),
                          Slider(
                            max: 100,
                            value: _Slider,
                            activeColor: onbordingBlue,
                            inactiveColor: greyScale,
                            onChanged: (value) {
                              setState(() {
                                _Slider = value;
                              });
                            },
                          ),
                          Row(
                            children: [
                              Text('15%', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: greyScale, fontWeight: FontWeight.w500),),
                              const Spacer(),
                              Text('\$12,000.00', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: notifire.getwhiteblackcolor, fontWeight: FontWeight.w700),),
                            ],
                          ),
                          const Spacer(),
                          Text('Loan tenor', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor, fontWeight: FontWeight.w700),),
                          Slider(
                            max: 100,
                            value: _Slider1,
                            activeColor: const Color(0xff22C55E),
                            inactiveColor: greyScale,
                            onChanged: (value) {
                              setState(() {
                                _Slider1 = value;
                              });
                            },
                          ),
                          Row(
                            children: [
                              Text('Tenor', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: greyScale, fontWeight: FontWeight.w500),),
                              const Spacer(),
                              Text('5 year', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: notifire.getwhiteblackcolor, fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  credit(type: 'Product type', name: 'Audi Q7 50 Quattro', color: notifire.getwhiteblackcolor),
                  credit(type: 'Down payment', name: '\$12,000.00', color: notifire.getwhiteblackcolor),
                  credit(type: 'Tenor', name: '5 year', color: notifire.getwhiteblackcolor),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    height: 10,
                    thickness: 1,
                    color: greyScale,
                  ),
                  credit(type: 'Product type', name: '\$970.00', color: onbordingBlue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget credit({required String type, required String name, Color? color}){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text(type, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale, fontWeight: FontWeight.w500),),
          const Spacer(),
          Text(name, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: color, fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}
