// ignore_for_file: prefer_const_constructors
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/Custom_widget.dart';
import '../utils/Dark_lightmode.dart';
import '../utils/fontfameli_model.dart';

class NewPaymentScreen extends StatefulWidget {
  const NewPaymentScreen({super.key});

  @override
  State<NewPaymentScreen> createState() => _NewPaymentScreenState();
}

class _NewPaymentScreenState extends State<NewPaymentScreen> {
  late ColorNotifire notifire;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Text("New payment", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 72,
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: onbordingBlue,
              ),
              child: ListTile(
                title: Text("Paypal", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: Colors.white,),),
                subtitle: Text("Online payment", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 12, color: Color(0xffA09CFF),),),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.blueAccent.withOpacity(0.50),
                  ),
                  child: Center(
                    child: Image.asset('assets/paypal.png', height: 24, width: 24,),
                  ),
                ),
              ),
            ),
            // Card number
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text("Card number", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: notifire.getwhiteblackcolor,),),
            ),
            SizedBox(
               height: 56,
               child: TextFormField(
                 inputFormatters: [
                   FilteringTextInputFormatter.digitsOnly,
                   CardNumberFormatter(),
                 ],
                 maxLength: 19,
                 keyboardType: TextInputType.number,
                 style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                 decoration: InputDecoration(
                   filled: true,
                   fillColor: notifire.getblackwhitecolor,
                   counter: Offstage(),
                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                   prefixIcon: Padding(
                     padding: const EdgeInsets.all(10),
                     child: Image.asset('assets/card1.png',),
                   ),
                   hintText: '0000 0000 0000 0000',
                   hintStyle: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                 ),
               ),
             ),
            // Expiry date and CVC
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Text("Expiry date", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: notifire.getwhiteblackcolor,),),
                          SizedBox(width: 10,),
                          Image.asset(Appcontent.question, height: 16, width: 16,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 56,
                      width: 157,
                      child: TextFormField(
                        maxLength: 5,
                        style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: notifire.getblackwhitecolor,
                          counter: Offstage(),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                          hintText: 'MM/YY',
                          hintStyle: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Text("CVC", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: notifire.getwhiteblackcolor,),),
                          SizedBox(width: 10,),
                          Image.asset(Appcontent.question, height: 16, width: 16,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 56,
                      width: 157,
                      child: TextFormField(
                        style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                        ],
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: notifire.getblackwhitecolor,
                          counter: Offstage(),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                          hintText: '000',
                          hintStyle: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Card holder
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text("Card holder", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: notifire.getwhiteblackcolor,),),
            ),
            SizedBox(
              height: 56,
              child: TextField(
                style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: notifire.getblackwhitecolor,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getblackwhitecolor)),
                  hintText: 'Full name',
                  hintStyle: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 14, color: greyScale,),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                  Checkbox(
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  side: BorderSide(color: notifire.getwhiteblackcolor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                RichText(
                    text: TextSpan(
                    children: [
                      TextSpan(text: 'I agree with ', style: TextStyle(color: greyScale, fontWeight: FontWeight.w700, fontFamily: 'GilroyBold', fontSize: 14)),
                      TextSpan(text: 'general terms ', style: TextStyle(color: onbordingBlue, fontWeight: FontWeight.w500, fontFamily: 'GilroyMedium', fontSize: 14)),
                      TextSpan(text: 'and ', style: TextStyle(color: greyScale, fontWeight: FontWeight.w700, fontFamily: 'GilroyBold', fontSize: 14)),
                      TextSpan(text: 'conditions', style: TextStyle(color: onbordingBlue, fontWeight: FontWeight.w500, fontFamily: 'GilroyMedium', fontSize: 14)),
                    ],
                 ),
                ),
              ],
            ),
            Expanded(child: SizedBox(height: 10,)),
            GestButton(
              height: 50,
              Width: Get.size.width,
              margin:
              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              buttoncolor: onbordingBlue,
              buttontext: "Sign In".tr,
              style: TextStyle(
                color: WhiteColor,
                fontFamily: FontFamily.gilroyBold,
                fontSize: 15,
              ),
              onclick: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
