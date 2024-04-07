// ignore_for_file: camel_case_types
import 'package:carguru/utils/App_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/Colors.dart';
import '../utils/Dark_lightmode.dart';
import '../utils/fontfameli_model.dart';

class faqScreen extends StatefulWidget {
  const faqScreen({super.key});

  @override
  State<faqScreen> createState() => _faqScreenState();
}

class _faqScreenState extends State<faqScreen> {
  late ColorNotifire notifire;
  int selectIndex = 0;

  List text = [
    'General',
    'Buy Car',
    'Sell Car',
    'Financing',
    'Simple',
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
        title: const Text("FAQ", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: Colors.white,),),
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
              height: 204,
              width: Get.width,
              color: onbordingBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('How can we\nhelp you CarGuru?', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff534CFF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xff534CFF))),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xff534CFF))),
                          hintText: 'Search question',
                          hintStyle: const TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xffC6C3FF)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(Appcontent.search, color: Colors.white, height: 24, width: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: text.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 85,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: selectIndex == index ? onbordingBlue : notifire.getbgcolor,
                        border: Border.all(color: selectIndex == index ? Colors.transparent : notifire.getborderColor,),
                      ),
                      child: Center(child: Text(text[index], style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 14, color: selectIndex == index ? Colors.white : notifire.getwhiteblackcolor, fontWeight: FontWeight.w500),)),
                    ),
                  );
                },),
            ),
            const SizedBox(height: 15,),
            faq(question: 'What is CarGuru?', text: '56', text1: '120'),
            faq(question: 'How do I get in contact with CarGuru?', text: '23', text1: '14'),
            faq(question: 'Do you offer business?', text: '0', text1: '100'),
            faq(question: 'Is CarGuru hiring?', text: '23', text1: '14'),
          ],
        ),
      ),
    );
  }

  Widget faq({required String question, required String text, required String text1}) {
    return Container(
      height: 87,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: notifire.getblackwhitecolor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(question, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: notifire.getwhiteblackcolor),),
            const SizedBox(height: 15,),
            Row(
              children: [
                Image.asset('assets/like.png', height: 16, width: 16,),
                const SizedBox(width: 5,),
                Text(text, style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale),),
                const SizedBox(width: 20,),
                Image.asset('assets/message.png', height: 16, width: 16,),
                const SizedBox(width: 5,),
                Text(text1, style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 12, color: greyScale),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}