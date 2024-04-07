import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/Dark_lightmode.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  late ColorNotifire notifire;
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
  List available = [
    '23 available car',
    '15 available car',
    '5 available car',
    '10 available car',
    '2 available car',
    '9 available car',
    '17 available car',
    '20 available car',
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, color: notifire.getwhiteblackcolor,)),
        title: Text('Brand car', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor,),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: notifire.getblackwhitecolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: notifire.getbgcolor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: notifire.getbgcolor),
                    ),
                    hintText: 'Search brand, or model...',
                    hintStyle: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 16, color: notifire.getwhiteblackcolor),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Appcontent.search, height: 24, width: 24,color: notifire.getwhiteblackcolor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Text('Most searched brand', style: TextStyle(fontFamily: 'gilroyBold', fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  clipBehavior: Clip.antiAlias,
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 104,
                      width: 98,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: notifire.getborderColor, width: 1)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.25),
                            ),
                            child: Center(
                              child: index == 3 ? Image.asset(img[3],height: 20, width: 20) : index == 7 ? Image.asset(img[7],height: 20, width: 20) : Image.asset(img[index], height: 20, width: 20, color: Colors.black,),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Text(logoname[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor, fontFamily: FontFamily.gilroyBold),)
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text('All brands', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
              SizedBox(
                height: Get.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  clipBehavior: Clip.antiAlias,
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 78,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: notifire.getborderColor, width: 1)
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.25),
                            ),
                            child: Center(
                              child: index == 3 ? Image.asset(img[3],height: 20, width: 20) : index == 7 ? Image.asset(img[7],height: 20, width: 20) : Image.asset(img[index], height: 20, width: 20, color: Colors.black,),
                            ),
                          ),
                          title: Text(logoname[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor, fontFamily: FontFamily.gilroyBold),),
                          subtitle: Text(available[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: notifire.getblackgreycolor, fontFamily: FontFamily.gilroyMedium),),
                          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20,color: greyScale),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
