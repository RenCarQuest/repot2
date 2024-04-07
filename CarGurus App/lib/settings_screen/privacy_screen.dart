import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/Colors.dart';
import '../utils/Dark_lightmode.dart';
import '../utils/fontfameli_model.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  late ColorNotifire notifire;
  List text = [
    '1. What information do we CarGuru?',
    '2. We Use Your Information For?',
    '3. How Do We Protect CarGuru?',
    '4. Online Analytics',
    '5. Children’s Privacy CarGuru',
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: onbordingBlue,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        title: const Text("Terms & Privacy Policy", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, color: Colors.white,),),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(backgroundImage: AssetImage('assets/05.png'),),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: Get.width,
              color: onbordingBlue,
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CarGuru privacy policy', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),),
                    SizedBox(height: 15,),
                    Text('Last updated: Apr 01, 2022', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xffC6C3FF)),),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 20),
              shrinkWrap: true,
              itemCount: text.length,
              itemBuilder: (context, index) {
                return Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    collapsedIconColor: notifire.getwhiteblackcolor,
                    title: Text(text[index], style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: notifire.getwhiteblackcolor),),
                    children: <Widget>[
                      ListTile(title: Text('We obtain information about you through the means discussed below when we provide the Services. Please note that we need certain types of information to provide the Services to you. If you do not provide us with such information, or if you ask us to delete that information, you may no longer be able to access or use certain Services.', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 14, color: greyScale1),),),
                    ],
                  ),
                );
            },),
          ],
        ),
      ),
    );
  }
}
