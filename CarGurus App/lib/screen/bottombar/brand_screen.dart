import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/App_content.dart';
import '../../utils/Colors.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class Brand1Screen extends StatefulWidget {
  const Brand1Screen({super.key});

  @override
  State<Brand1Screen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<Brand1Screen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text('All brands', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor),),
            ),
            SizedBox(
              height: Get.height,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                clipBehavior: Clip.antiAlias,
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 78,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: notifire.getborderColor, width: 1),
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
    );
  }
}
