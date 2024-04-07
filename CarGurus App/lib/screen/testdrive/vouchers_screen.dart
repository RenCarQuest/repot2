import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/App_content.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
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
        elevation: 0,
        title: Text("Vouchers", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 16,),
        ),
        actions: [
          Image.asset("assets/question-circle-outlined.png", height: 25, width: 25,),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    hintText: 'Enter promo code',
                    hintStyle: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 16, color: greyScale1),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Text("Active vouchers", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 18, fontWeight: FontWeight.w700),),
              const SizedBox(height: 15,),
              Stack(
                children: [
                  Container(
                    height: 207,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: onbordingBlue, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            vouchers(img: Appcontent.clock, name: 'Valid until', text: 'July 15, 2022'),
                            const Spacer(),
                            vouchers(img: Appcontent.dollar, name: 'Min. Transaction', text: '\$10,000.00'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 135,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      color: onbordingBlue,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset(Appcontent.toyota, height: 35, width: 35,),
                            ),
                          ),
                          title: Text('#summersale', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
                          subtitle: const Text('Save up to \$3,000 on sale car', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              MySeparator(color: Colors.grey),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: Row(
                            children: [
                              Text('Your coupon code:', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
                              const Spacer(),
                              const Text('TOYTA25', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Stack(
                children: [
                  Container(
                    height: 207,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: notifire.getborderColor, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            vouchers(img: Appcontent.clock, name: 'Valid until', text: 'July 15, 2022'),
                            const Spacer(),
                            vouchers(img: Appcontent.dollar, name: 'Min. Transaction', text: '\$10,000.00'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 135,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      color: Color(0xff0F172A),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: greyScale1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset(Appcontent.tesla, height: 35, width: 35,),
                            ),
                          ),
                          title: Text('#summersale', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
                          subtitle: const Text('Save up to \$3,000 on sale car', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              MySeparator(color: Colors.grey),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: Row(
                            children: [
                              Text('Your coupon code:', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale1),),
                              const Spacer(),
                              const Text('TESLAMXX', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget vouchers({required String img, required String name, required String text}){
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: const Color(0xff1B2537),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(img, height: 16, width: 16, color: greyScale1,),
            ),
          ),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 10, color: greyScale1),),
              const SizedBox(height: 5,),
              Text(text, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 12, color: notifire.getwhiteblackcolor),),
            ],
          ),
        ],
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}