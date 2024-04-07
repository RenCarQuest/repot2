import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/App_content.dart';
import '../utils/Colors.dart';
import '../utils/Custom_widget.dart';
import '../utils/Dark_lightmode.dart';
import '../utils/fontfameli_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late ColorNotifire notifire;
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: onbordingBlue,
        centerTitle: true,
        elevation: 0,
        title: Text("Edit account", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 16,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: Get.width,
              color: onbordingBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: AssetImage(Appcontent.profile),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(Appcontent.edit,),
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            edit(title: 'Full name'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 16,),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: notifire.getbgcolor),
                  ),
                  hintText: 'Full name',
                  hintStyle: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 16, color: greyScale1),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/profileOutline.png', height: 24, width: 24,color: greyScale1),
                  ),
                ),
              ),
            ),
            edit(title: 'Phone number'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 16,),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: notifire.getbgcolor),
                  ),
                  hintText: 'Phone number',
                  hintStyle: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 16, color: greyScale1),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(Appcontent.phone, height: 24, width: 24,color: greyScale1),
                  ),
                ),
              ),
            ),
            edit(title: 'Email address'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 16,),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: notifire.getbgcolor),
                  ),
                  hintText: 'Email address',
                  hintStyle: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 16, color: greyScale1),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(Appcontent.mail, height: 24, width: 24,color: greyScale1),
                  ),
                ),
              ),
            ),
            edit(title: 'Password'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                obscureText: passwordVisible,
                style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 16,),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: notifire.getbgcolor),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 16, color: greyScale1),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(Appcontent.lock, height: 24, width: 24,color: greyScale1),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible =! passwordVisible;
                        });
                      },
                      icon: Icon(passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined, color: greyScale1),
                  ),
                ),
              ),
            ),
            GestButton(
              height: 50,
              Width: Get.size.width,
              margin:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              buttoncolor: onbordingBlue,
              buttontext: "Save Change".tr,
              style: TextStyle(
                color: WhiteColor,
                fontFamily: FontFamily.gilroyBold,
                fontSize: 15,
              ),
              onclick: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget edit({required String title}){
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Text(title, style: TextStyle(fontFamily: FontFamily.gilroyBold, color: greyScale1, fontSize: 14, fontWeight: FontWeight.w700),),
    );
  }
}
