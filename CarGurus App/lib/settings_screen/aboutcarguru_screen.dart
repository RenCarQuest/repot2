import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/Dark_lightmode.dart';
import '../utils/fontfameli_model.dart';

class AboutcarScreen extends StatefulWidget {
  const AboutcarScreen({super.key});

  @override
  State<AboutcarScreen> createState() => _AboutcarScreenState();
}

class _AboutcarScreenState extends State<AboutcarScreen> {
  late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: onbordingBlue,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(Appcontent.logo,),
        ),
        title: const Text("CarGuru", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 20, color: Colors.white,),),
        actions: const [
          Icon(Icons.menu, color: Colors.white),
          SizedBox(width: 15,),
        ],
       ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              width: Get.width,
              color: onbordingBlue,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("OUR MISSION", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: Color(0xffFACC15),),),
                    Text("Make car purchase and ownership simple.", style: TextStyle(fontWeight: FontWeight.w700, fontFamily: FontFamily.gilroyBold, fontSize: 32, color: Colors.white,),),
                    Text("We bring you new markets, new customers and new opportunities for the purchase and sale of used cars. Now you can buy and sell a used car safely and comfortablly online, with only a few easy clicks.", style: TextStyle(fontWeight: FontWeight.w500, fontFamily: FontFamily.gilroyMedium, fontSize: 16, color: Color(0xffA09CFF),),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ListTile(
              title: Text("Why choose us?", style: TextStyle(fontWeight: FontWeight.w700, fontFamily: FontFamily.gilroyBold, fontSize: 20, color: notifire.getwhiteblackcolor,),),
              subtitle: Text("Used cars are an incredible value. But the process needed a makeover.", style: TextStyle(fontWeight: FontWeight.w500, fontFamily: FontFamily.gilroyMedium, fontSize: 14, color: greyScale1,),),
            ),
            carguru(img: 'assets/card.png', title: 'Financing Made Simple', subtext: 'Get personalized loan terms and monthly payment in minutes without impacting your credit score.'),
            carguru(img: 'assets/shield-check.png', title: 'Protect your vehicle', subtext: 'Safeguard yourself from the unexpected costs of car ownership with a vehicle protection plan and gap coverage.'),
          ],
        ),
      ),
    );
  }
  Widget carguru({required String img, required String title, required String subtext}){
    return Container(
      height: 194,
      width: Get.width,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getblackwhitecolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: onbordingBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(img, color: Colors.white),
              ),
            ),
            Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontFamily: FontFamily.gilroyBold, fontSize: 20, color: notifire.getwhiteblackcolor,),),
            Text(subtext, style: TextStyle(fontWeight: FontWeight.w500, fontFamily: FontFamily.gilroyMedium, fontSize: 14, color: greyScale1,),),
          ],
        ),
      ),
    );
  }
}
