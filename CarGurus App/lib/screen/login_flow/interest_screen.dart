import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/Custom_widget.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';
import '../bottombar/bottombar_screen.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  late ColorNotifire notifire;
  List<int> selectedItems = [];
  List text = [
    'Tesla',
    'BMW',
    'Lamborghini',
    'Ford',
    'Land Rover',
    'Toyota',
    'Audi',
    'Ferrari',
  ];
  List img = [
    Appcontent.tesla,
    Appcontent.bmw,
    Appcontent.lamborghini,
    Appcontent.ford,
    Appcontent.landrover,
    Appcontent.toyota,
    Appcontent.audi,
    Appcontent.ferrari,
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: notifire.getbgcolor,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
              child: Image.asset(Appcontent.back, height: 24, width: 24, color: notifire.getwhiteblackcolor,)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(const BottomBarScreen());
              },
                child: Text('Skip', style: TextStyle(fontFamily: 'gilroyBold', fontSize: 16, fontWeight: FontWeight.w700, color: onbordingBlue),)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Which brand of car do\nyou prefer?', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 24, color: notifire.getwhiteblackcolor),),
              const SizedBox(height: 10,),
              Text('Select all that you interested in.', style: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 16, color: greyScale),),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(vertical: 25),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: text.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 1.5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if(selectedItems.contains(index)) {
                            selectedItems.remove(index);
                          } else {
                            selectedItems.add(index);
                          }
                        });
                      },
                      child: Container(
                        height: 104,
                        width: 155,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: selectedItems.contains(index) ? onbordingBlue : notifire.getborderColor, width: 1)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selectedItems.contains(index) ? onbordingBlue : Colors.grey.withOpacity(0.25),
                              ),
                              child: Center(
                                child: index == 2 ? Image.asset(img[2],height: 20, width: 20) : index == 7 ? Image.asset(img[7],height: 20, width: 20) : Image.asset(img[index], height: 20, width: 20, color: selectedItems.contains(index) ? Colors.white : Colors.black,),
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Text(text[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: selectedItems.contains(index) ? onbordingBlue : notifire.getwhiteblackcolor),)
                          ],
                        ),
                      ),
                    );
                  },
              ),
              GestButton(
                height: 50,
                Width: Get.size.width,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                buttontext: 'Finish',
                style: const TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                onclick: () {
                  Get.to(const BottomBarScreen());
                },
                buttoncolor: onbordingBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
