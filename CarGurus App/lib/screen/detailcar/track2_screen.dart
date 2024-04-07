import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class Track2Screen extends StatefulWidget {
  const Track2Screen({super.key});

  @override
  State<Track2Screen> createState() => _Track2ScreenState();
}

class _Track2ScreenState extends State<Track2Screen> {
  late ColorNotifire notifire;
  late GoogleMapController mapController;
  List img = [
    Appcontent.global,
    Appcontent.phone,
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: Get.height,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(27.7089427, 85.3086209), //initial position
                    zoom: 15.0, //initial zoom level
                  ),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  zoomGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
              ),
              Positioned(
                left: 15,
                  top: 40,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: notifire.getbgcolor,
                      ),
                      child: Icon(Icons.arrow_back, color: notifire.getwhiteblackcolor),
                    ),
                  ),
              ),
              Positioned(
                child: Container(
                  height: 362,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                    color: notifire.getbgcolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: notifire.getborderColor, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifire.getblackwhitecolor,
                                ),
                                child: Center(
                                  child: Image.asset(Appcontent.dhl, height: 6, width: 38,),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("#19984442MPX", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
                                  Text("DHL Express", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale1,),),
                                ],
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: img.length,
                                itemBuilder: (context, index) {
                                 return Container(
                                    height: 40,
                                    width: 40,
                                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: notifire.getborderColor),
                                    ),
                                    child: Container(
                                        padding: const EdgeInsets.all(6),
                                        child: Image.asset(img[index], height: 10, width: 10,)),
                                  );
                                },

                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Estimate delivery", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale1,),),
                                const SizedBox(height: 10,),
                                Text("July 29, 2022", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
                              ],
                            ),
                            const SizedBox(width: 100,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Status", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale1,),),
                                const SizedBox(height: 10,),
                                Text("On Progress", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: onbordingBlue,),),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            track(title: 'From', name: 'St. Petersburg', address: 'Jackson Street, San\nFrancisco, California'),
                            const Spacer(),
                            track(title: 'To', name: 'San Francisco', address: 'Jackson Street, San\nFrancisco, California'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget track({required String title, required String name, required String address}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(title, style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale1,),),
         const SizedBox(height: 10,),
         Text(name, style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
         const SizedBox(height: 10,),
         Text(address, style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale1,),),
      ],
    );
  }
}