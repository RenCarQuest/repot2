// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:carguru/screen/detailcar/recipt_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/App_content.dart';
import '../../utils/Colors.dart';
import '../../utils/Custom_widget.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class PaymethodScreen extends StatefulWidget {
  const PaymethodScreen({super.key});

  @override
  State<PaymethodScreen> createState() => _PaymethodScreenState();
}

class _PaymethodScreenState extends State<PaymethodScreen> {
  late ColorNotifire notifire;
  List img = [
    'assets/mastercard1.png',
    'assets/paypal2.png',
    'assets/apple3.png',
    'assets/google4.png',
  ];
  List text = [
    'Credit/Debit Card',
    'Paypal',
    'Apple Pay',
    'Google Pay',
  ];
  var revalue;
  int? covalue;
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
            padding: const EdgeInsets.all(12),
            child: Image.asset("assets/back.png", color: notifire.getwhiteblackcolor,),
          ),
        ),
        centerTitle: true,
        title: Text("Payment method", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
      ),
      bottomNavigationBar: GestButton(
        height: 50,
        Width: Get.size.width,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        buttontext: "Select Payment",
        style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 15,),
        buttoncolor: onbordingBlue,
        onclick: () {
          Get.to(const ReciptScreen());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(Appcontent.creditcard),
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xffEB001B),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xffF79E1B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        const Text('****  ****  ****  1990', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),),
                        const SizedBox(height: 15,),
                        const Text('09/23', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xffC6C3FF)),),
                        const SizedBox(height: 30,),
                        const Text('Saski Approval', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),),
                      ],
                    ),
                  ),
                ],
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        revalue = index;
                        covalue = index;
                      });
                    },
                    child: Container(
                      height: 64,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: notifire.getborderColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(child: Image(image: AssetImage(img[index]), height: 28, width: 28,)),
                          ),
                          Text(text[index], style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: notifire.getwhiteblackcolor, fontWeight: FontWeight.w700),),
                          const Expanded(child: SizedBox(width: 10,)),
                          Radio(
                            value: index,
                            fillColor: MaterialStateColor.resolveWith((states) => revalue == index? const Color(0xff7975ff) : Colors.grey.shade400),
                            groupValue: revalue,
                            onChanged: (value) {
                              setState(() {
                                revalue = value;
                              });
                            },
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  );
                },),
            ],
          ),
        ),
      ),
    );
  }
}
