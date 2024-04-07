import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/Dark_lightmode.dart';

class ChatScreen extends StatefulWidget {
  final String image;
  final String name;
  final String status;

  const ChatScreen({super.key, required this.image, required this.name, required this.status});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ColorNotifire notifire;
  TextEditingController message = TextEditingController();

  List img = [
    'assets/chat1.png',
    'assets/chat2.png',
    'assets/chat3.png',
    'assets/chat4.png',
    'assets/chat5.png',
    'assets/chat6.png',
  ];
  List text = [
    'Camera',
    'Galery',
    'Document',
    'Audio',
    'Location',
    'Contact',
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  Container(
        height: 40,
        color: notifire.getbgcolor,
        child: Center(
          child: ListTile(
            leading: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/05.png',),),
                  borderRadius: BorderRadius.circular(100)),
            ),
            title: SizedBox(
              height: 40,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: notifire.getwhiteblackcolor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Type something in here...',
                  hintStyle: const TextStyle(color: Color(0xffCBD5E1), fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            trailing: SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                heroTag: null,
                backgroundColor: const Color(0xff3BBAA6),
                elevation: 0,
                onPressed: () {},
                child: const Icon(Icons.send),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color:  notifire.getwhiteblackcolor,),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Container(
                    decoration: BoxDecoration(
                        image:  DecorationImage(image: AssetImage(widget.image),),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 18,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xff0AD67E),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(widget.name, style: TextStyle(fontSize: 14, fontFamily: 'Urbanist-semibold', fontWeight: FontWeight.w600, color:  notifire.getwhiteblackcolor,),),
            Text(widget.status, style: const TextStyle(fontSize: 12, fontFamily: 'Urbanist-semibold', fontWeight: FontWeight.w600, color: Color(0xff0AD67E)),),
          ],
        ),
        actions: [
          Image.asset(Appcontent.phone, height: 24, width: 24,),
          const SizedBox(width: 15,),
          Icon(Icons.more_vert, size: 24, color: notifire.getwhiteblackcolor,),
          const SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 32,
                width: 75,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side:  BorderSide(color: Colors.grey.shade100))),
                  ),
                  child: const Center(
                      child: Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist-semibold',
                            color: Color(0xff3BBAA6)),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('09.35 AM', style: TextStyle(fontSize: 12, fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, color: Color(0xff64748B)),),
                const SizedBox(width: 15),
                Container(
                  height: 95,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  child: const Center(
                      child: Text("Sorry for just replying to\nyour message. of course it's\na very memorable thing for\nme friend.", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.gilroyMedium, color: Colors.black))),
                ),
                Container(
                  height: 24,
                  width: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 173,
                    width: Get.size.width,
                    decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage('assets/05.png',), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('09.38 AM', style: TextStyle(fontSize: 12, fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, color: Color(0xff64748B)),),
                const SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 111,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  child: const Center(
                      child: Text("How are you?", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.gilroyMedium, color: Colors.black),)),
                ),
                Container(
                  height: 24,
                  width: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 173,
                    width: Get.size.width,
                    decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage('assets/05.png',), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 24,
                  width: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 173,
                    width: Get.size.width,
                    decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage('assets/02.png',), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 147,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:  Colors.grey.shade100,
                  ),
                  child: const Center(
                      child: Text("I’m fine, thanks bro.", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.gilroyMedium, color: Colors.black),)),
                ),
                const SizedBox(width: 15),
                const Text('09.40 AM', style: TextStyle(fontSize: 12, fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, color: Color(0xff64748B)),),
                const SizedBox(width: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
