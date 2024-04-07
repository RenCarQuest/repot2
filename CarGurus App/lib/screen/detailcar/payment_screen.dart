import 'package:carguru/screen/detailcar/paymethod_screen.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/App_content.dart';
import '../../utils/Colors.dart';
import '../../utils/Custom_widget.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentsScreen> {
  late ColorNotifire notifire;
  bool isChecked = false;
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
        title: Text("Payment", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
      ),
      bottomNavigationBar: GestButton(
        height: 50,
        Width: Get.size.width,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        buttontext: "Confirm address",
        style: TextStyle(fontFamily: FontFamily.gilroyBold, color: WhiteColor, fontSize: 15,),
        buttoncolor: onbordingBlue,
        onclick: () {
          Get.to(const PaymethodScreen());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Method of payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: FontFamily.gilroyBold,color: notifire.getwhiteblackcolor),),
                  const Expanded(child: SizedBox(width: 10,)),
                  TextButton(
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Image.asset(Appcontent.newcard, height: 20, width: 20,),
                        const SizedBox(width: 10,),
                        Text('Change', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: FontFamily.gilroyBold,color: onbordingBlue),),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: notifire.getblackwhitecolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Credit or Debit card', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: FontFamily.gilroyBold,color: notifire.getwhiteblackcolor),),
                          const SizedBox(height: 10,),
                          Text('Online payment', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: FontFamily.gilroyBold,color: greyScale1),),
                        ],
                      ),
                      const Expanded(child: SizedBox(width: 10,)),
                      Container(
                        height: 40,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff1B2537),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xffEB001B),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xffF79E1B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: 40,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff1B2537),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset('assets/Visa Inc. svg.png'),
                          ),
                        ),
                      ),
                    ],
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
                    counter: const Offstage(),
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
                            const SizedBox(width: 10,),
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
                            counter: const Offstage(),
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
                            const SizedBox(width: 10,),
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
                            counter: const Offstage(),
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
              const SizedBox(height: 15,),
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
            ],
          ),
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
