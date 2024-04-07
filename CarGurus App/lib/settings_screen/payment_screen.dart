// ignore_for_file: prefer_const_constructors
import 'package:carguru/settings_screen/newpayment_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/Dark_lightmode.dart';
import '../utils/fontfameli_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late ColorNotifire notifire;
  List<Color> colors = [
    Colors.black,
    onbordingBlue,
    const Color(0xffF9FAFB),
  ];
  List img = [
    'assets/apple.png',
    'assets/paypal.png',
    'assets/google.png',
  ];
  List text = [
    'Apple Pay',
    'Paypal',
    'Google Pay',
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
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
        title: Text("Payment method", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Saved cards', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'GilroyBold',color: notifire.getwhiteblackcolor),),
                  Expanded(child: SizedBox(width: 10,)),
                  TextButton(
                      onPressed: () {
                        Get.to(NewPaymentScreen());
                      },
                      child: Row(
                        children: [
                          Image.asset(Appcontent.newcard, height: 20, width: 20,),
                          SizedBox(width: 10,),
                          Text('Add new card', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'GilroyBold',color: onbordingBlue),),
                        ],
                      ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Stack(
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
                                    color: Color(0xffEB001B),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xffF79E1B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40,),
                            Text('****  ****  ****  1990', style: TextStyle(fontFamily: 'GilroyBold', fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),),
                            SizedBox(height: 15,),
                            Text('09/23', style: TextStyle(fontFamily: 'GilroyBold', fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xffC6C3FF)),),
                            SizedBox(height: 30,),
                            Text('Alon musk', style: TextStyle(fontFamily: 'GilroyMedium', fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              Text('Other payment method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'GilroyBold',color: notifire.getwhiteblackcolor),),
              SizedBox(height: 15,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    height: 72,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: notifire.getblackwhitecolor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: colors[index],
                          ),
                          child: Center(child: Image(image: AssetImage(img[index]), height: 28, width: 28,)),
                        ),
                        Text(text[index], style: TextStyle(fontFamily: 'GilroyBold', fontSize: 14, color: notifire.getwhiteblackcolor, fontWeight: FontWeight.w700),),
                        Spacer(),
                        Text('Not connected', style: TextStyle(fontFamily: 'GilroyMedium', fontSize: 14, color: greyScale1, fontWeight: FontWeight.w500),),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward_ios, size: 20, color: greyScale1,),
                        SizedBox(width: 20,),
                      ],
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
