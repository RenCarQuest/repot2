import 'package:carguru/screen/detailcar/track_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/Dark_lightmode.dart';

class ReciptScreen extends StatefulWidget {
  const ReciptScreen({super.key});

  @override
  State<ReciptScreen> createState() => _ReciptScreenState();
}

class _ReciptScreenState extends State<ReciptScreen> {
  late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 662,
          width: Get.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 334,
                width: Get.width,
                color: onbordingBlue,
              ),
              Positioned(
                left: 20,
                top: 50,
                child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.white,),
              ),),
              Positioned(
                bottom: -80,
                left: 20,
                right: 20,
                child: Container(
                  height: 662,
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/modelcar.png'),
                      Image.asset(Appcontent.audi, color: onbordingBlue, width: 50,),
                      Text('Audi Q7 50 Quattro', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor),),
                      Text('Receipt #1998-4442', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Divider(
                          height: 10,
                          thickness: 1,
                          color: greyScale,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text('Status', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
                                const Spacer(),
                                const Text('Confirmed', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xff22C55E)),),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Payment method', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
                                const Spacer(),
                                Text('9969', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale),),
                                const SizedBox(width: 8,),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xffEB001B),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: const Color(0xffF79E1B),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                              child: Divider(
                                height: 10,
                                thickness: 1,
                                color: greyScale,
                              ),
                            ),
                            receipt(text: 'Date', title: 'May 27, 2022 04:00 PM'),
                            const SizedBox(height: 10,),
                            receipt(text: 'Name', title: 'Saski Ropokova'),
                            const SizedBox(height: 10,),
                            receipt(text: 'Address', title: 'Jackson Street, San Francisco,\nCalifornia 94109'),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                              child: Divider(
                                height: 10,
                                thickness: 1,
                                color: greyScale,
                              ),
                            ),
                            receipt(text: 'Item subtotal', title: '\$80,063.00'),
                            const SizedBox(height: 15,),
                            receipt(text: 'Shipping', title: '\$400.00'),
                            const SizedBox(height: 15,),
                            Row(
                              children: [
                                Text('Total', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale),),
                                const Spacer(),
                                Text('\$80,463.00', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 12, color: onbordingBlue), textAlign: TextAlign.end),
                              ],
                            ),
                            const SizedBox(height: 40,),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: onbordingBlue, width: 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                fixedSize: Size(Get.width, 56)),
                                onPressed: () {
                                  Get.to(const TrackScreen());
                                },
                                child: Text('Tracking', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: onbordingBlue),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget receipt({required String text, required String title}){
    return Row(
      children: [
        Text(text, style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
        const Spacer(),
        Text(title, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 12, color: notifire.getwhiteblackcolor), textAlign: TextAlign.end),
      ],
    );
  }
}
