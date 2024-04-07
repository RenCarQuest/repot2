import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/Colors.dart';
import '../utils/Dark_lightmode.dart';
import '../utils/fontfameli_model.dart';

class LinkaccountScreen extends StatefulWidget {
  const LinkaccountScreen({super.key});

  @override
  State<LinkaccountScreen> createState() => _LinkaccountScreenState();
}

class _LinkaccountScreenState extends State<LinkaccountScreen> {
  late ColorNotifire notifire;
  List<Color> colors = [
    const Color(0xffF9FAFB),
    Colors.black,
    onbordingBlue,
  ];
  List img = [
    'assets/google.png',
    'assets/apple.png',
    'assets/twiter.png',
  ];
  List text = [
    'Login with Google',
    'Login with Apple',
    'Login with Twitter',
  ];

  bool isSwitch_1 = false;
  bool isSwitch_2 = false;
  bool isSwitch_3 = false;

  onChange1(bool value1) {
    setState(() {
      isSwitch_1 = value1;
    });
  }
  onChange2(bool value2) {
    setState(() {
      isSwitch_2 = value2;
    });
  }
  onChange3(bool value3) {
    setState(() {
      isSwitch_3 = value3;
    });
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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(13),
            child: Image.asset("assets/back.png", color: WhiteColor,),
          ),
        ),
        title: Text("Link account", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 16,),),
      ),
      body: Column(
        children: [
          Container(
            height: Get.size.height * 0.3 ,
            width: Get.size.width,
            color: onbordingBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: WhiteColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/jeep.png"),
                  ),
                ),
                const SizedBox(height: 15,),
                Text("Alon musk", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: WhiteColor,),),
                const SizedBox(height: 5,),
                Text("Buyer’s Account", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 14, color: greyScale),),
                const Expanded(child: SizedBox(height: 30,)),
              ],
            ),
          ),
          linkaccount(img[0], text[0], colors[0], isSwitch_1, onChange1),
          linkaccount(img[1], text[1], colors[1], isSwitch_2, onChange2),
          linkaccount(img[2], text[2], colors[2], isSwitch_3, onChange3),
        ],
      ),
    );
  }
  Widget linkaccount(String img, String text, Color color, bool isSwitch, Function onChangedMethod,   ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: notifire.getborderColor, width: 1),
        ),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: color,
              ),
              child: Center(child: Image(image: AssetImage(img), height: 28, width: 28,)),
            ),
            Text(text, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 14, color: notifire.getwhiteblackcolor),),
            const Expanded(child: SizedBox(width: 10,)),
            CupertinoSwitch(
              activeColor: const Color(0xff0056D2),
              thumbColor: Colors.white,
              value: isSwitch,
              onChanged: (value) {
                onChangedMethod(value);
              },
            ),
            const SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
