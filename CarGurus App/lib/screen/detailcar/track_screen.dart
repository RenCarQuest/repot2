import 'package:carguru/screen/detailcar/track2_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  late ColorNotifire notifire;
  List img = [
    Appcontent.package,
    Appcontent.delivery,
    Appcontent.filetext,
    Appcontent.box1,
  ];
  List name = [
    'Package delivered',
    'Package is being sent',
    'Package is processed',
    'Payment verified',
  ];
  List subtext = [
    'St Jackson, San Francisco',
    'With cargo',
    'St Petersburg, Russia',
    'Credit Card',
  ];
  List time = [
    '',
    'Jul 15, 09:15',
    'Jul 14, 08:00',
    'Jul 13, 10:45',
  ];
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
        title: Text("Tracking", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  color: notifire.getblackwhitecolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(const Track2Screen()),
                        child: ListTile(
                          leading: Transform.translate(
                              offset: const Offset(0, 10),
                              child: Image.asset(Appcontent.delivery, height: 24, width: 24, color: notifire.getwhiteblackcolor,)),
                          title: Text('#19984442MPX', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                          subtitle: Text('On Progress', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: onbordingBlue,),),
                          trailing: Icon(Icons.arrow_forward_ios_rounded, color: notifire.getwhiteblackcolor,),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Estimate delivery', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 18, color: greyScale1,),),
                              const SizedBox(height: 10,),
                              Text('July 29, 2022', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                            ],
                          ),
                          const Expanded(child: SizedBox(width: 10,)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipment', style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 18, color: greyScale1,),),
                              const SizedBox(height: 10,),
                              Text('DHL Express', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Text('Delivery status', style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
              const SizedBox(height: 15,),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 25),
                shrinkWrap: true,
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20,right: 10),
                    child: TimelineTile(
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,top: 20),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(name[index], style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                                          Text(subtext[index], style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale1, fontWeight: FontWeight.w500),),
                                          Text(time[index], style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale1, fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      beforeLineStyle: LineStyle(color: Colors.grey.withOpacity(0.4),thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 48,
                          width: 48,
                          indicator: index == 1 ? Container(
                            decoration: BoxDecoration(
                                color: onbordingBlue,
                                borderRadius: const BorderRadius.all(Radius.circular(65)),
                                border: Border.all(color: onbordingBlue,width: 4)
                            ),
                            child: Center(
                              child: Image.asset(img[index], height: 24, width: 24, color: Colors.white,),
                            ),
                          ) : Container(
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor,
                                borderRadius: const BorderRadius.all(Radius.circular(65)),
                                border: Border.all(color: greyScale1,width: 1)
                            ),
                            child: Center(
                              child: Image.asset(img[index], height: 24, width: 24,),
                            ),
                          ),
                      ),
                    ),
                  );
              },),
            ],
          ),
        ),
      ),
    );
  }
}
