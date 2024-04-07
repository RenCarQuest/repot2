import 'package:carguru/screen/availablecar/brand_screen.dart';
import 'package:carguru/screen/availablecar/features_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../utils/Custom_widget.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectIndex = 0;
  int selectIndex1 = 0;
  bool light = true;
  late ColorNotifire notifire;
  List text = [
    'Free test drive',
    'Toyota',
    '\$23K - \$80K',
  ];
  List logoname = [
    'Tesla',
    'Toyota',
    'BMW',
    'Lamborghini',
    'Ford',
    'Land Rover',
    'Audi',
    'Ferrari',
  ];
  List img = [
    Appcontent.tesla,
    Appcontent.toyota,
    Appcontent.bmw,
    Appcontent.lamborghini,
    Appcontent.ford,
    Appcontent.landrover,
    Appcontent.audi,
    Appcontent.ferrari,
  ];
  List features = [
    'Navigation',
    'Climate Control',
    'Air Conditioning',
  ];

  final DateTime _dateMin = DateTime(2003, 01, 01);
  final DateTime _dateMax = DateTime(2006, 01, 01);
  final SfRangeValues _dateValues =
  SfRangeValues(DateTime(2004, 01, 01), DateTime(2006, 01, 01));

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: const Color(0xff0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xff0F172A),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 14, color: greyScale),)),
        ),
        title: const Text('Filters', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: text.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    width: index == 0 ? 143 : index == 1 ? 94 : 129,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff1B2537),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(text[index], style: const TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),),
                          const Icon(Icons.close, color: Colors.grey,),
                        ],
                      ),
                    ),
                  );
              },),
            ),
            const SizedBox(height: 45,),
            Container(
              height: Get.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                color: notifire.getbgcolor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: notifire.getblackwhitecolor,
                      ),
                      child: ListTile(
                        leading: Image.asset(Appcontent.testDrive, height: 40, width: 40, color: notifire.getwhiteblackcolor),
                        title: Text('Free test drive', style: TextStyle(fontFamily: 'gilroyBold', fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
                        trailing: Transform.scale(
                          scale: 1,
                          child: Switch(
                            value: light,
                            activeColor: onbordingBlue,
                            onChanged: (bool value) {
                              setState(() {
                                light = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Brand car', style: TextStyle(fontFamily: 'gilroyBold', fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
                        TextButton(
                            onPressed: () {
                              Get.to(const BrandScreen());
                            },
                            child: Text('More brand', style: TextStyle(fontFamily: 'gilroyMedium', fontSize: 14, fontWeight: FontWeight.w500, color: notifire.getlightblack),),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        clipBehavior: Clip.antiAlias,
                        itemCount: img.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectIndex = index;
                              });
                            },
                            child: Container(
                              height: 104,
                              width: 98,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: selectIndex == index ? onbordingBlue : notifire.getborderColor, width: 1)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: selectIndex == index ? onbordingBlue : Colors.grey.withOpacity(0.25),
                                    ),
                                    child: Center(
                                      child: index == 3 ? Image.asset(img[3],height: 20, width: 20) : index == 7 ? Image.asset(img[7],height: 20, width: 20) : Image.asset(img[index], height: 20, width: 20, color: selectIndex == index ? Colors.white : Colors.black,),
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Text(logoname[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: selectIndex == index ? onbordingBlue : notifire.getwhiteblackcolor),)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text('Price range', style: TextStyle(fontFamily: 'gilroyBold', fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
                    Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Center(
                                child: SfRangeSelector(
                                  min: _dateMin,
                                  max: _dateMax,
                                  initialValues: _dateValues,
                                  activeColor: onbordingBlue,
                                  inactiveColor: greyScale,
                                  labelPlacement: LabelPlacement.betweenTicks,
                                  interval: 1,
                                  dateIntervalType: DateIntervalType.years,
                                  dateFormat: DateFormat.y(),
                                  showTicks: false,
                                  showLabels: true,
                                  child: SizedBox(
                                    width: Get.width,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Features', style: TextStyle(fontFamily: 'gilroyBold', fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
                          TextButton(
                            onPressed: () {
                              Get.to(const FeatureScreen());
                            },
                            child: Text('More feature', style: TextStyle(fontFamily: 'gilroyMedium', fontSize: 14, fontWeight: FontWeight.w500, color: notifire.getlightblack),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        clipBehavior: Clip.antiAlias,
                        itemCount: features.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectIndex1 = index;
                              });
                            },
                            child: Container(
                              height: 68,
                              width: index == 0 ? 103 : index == 1 ? 136 : 138,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: selectIndex1 == index ? onbordingBlue : notifire.getborderColor, width: 1)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(features[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: selectIndex1 == index ? onbordingBlue : notifire.getwhiteblackcolor),)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    GestButton(
                      height: 50,
                      Width: Get.size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      buttontext: 'Apply Filter',
                      style: const TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                      onclick: () {
                        Get.back();
                      },
                      buttoncolor: onbordingBlue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  Data({required this.x, required this.y});
  final DateTime x;
  final double y;
}
