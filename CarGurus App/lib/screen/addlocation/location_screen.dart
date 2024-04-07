import 'package:carguru/screen/bottombar/home_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../utils/App_content.dart';
import '../../utils/Custom_widget.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late ColorNotifire notifire;
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: Padding(
         padding: const EdgeInsets.all(10),
         child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(Appcontent.back, height: 24, width: 24,color: notifire.getwhiteblackcolor,)),
        ),
        title: Text('Choose your location', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/map-pin.png", height: 25, width: 25, color: notifire.getwhiteblackcolor,),
                const SizedBox(width: 15,),
                Expanded(
                  child: Text("Clay Street, San Fransisco", style: TextStyle(fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor, fontSize: 16,),),
                ),
              ],
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(color: grey50),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
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
            ),
            Container(
              height: 84,
              decoration: BoxDecoration(
                color: notifire.getbgcolor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xffEEF2F6), width: 1),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Image.asset(Appcontent.mappin1, height: 22, width: 22,),
                    ),
                  ),
                  title: Text('Use my current location', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 16, color: notifire.getwhiteblackcolor),),
                  subtitle: Text('Jackson Street, San Francisco', style: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w700, fontSize: 16, color: greyScale1),),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20, color: notifire.getwhiteblackcolor,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: '50 ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: notifire.getwhiteblackcolor)),
                    TextSpan(text: ' available car in current location!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: notifire.getlightblack)),
                  ],
                ),
              ),
            ),

            const Expanded(child: SizedBox(height: 10,)),
            GestButton(
              height: 50,
              Width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              buttontext: 'Continue',
              style: const TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
              onclick: () {
                Get.to(const HomeScreen());
              },
              buttoncolor: onbordingBlue,
            ),
            NormalButton(
              height: 50,
              width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              buttonText: "Skip",
              onTap: () {
                Get.to(const HomeScreen());
              },
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: onbordingBlue,
                fontSize: 15,
              ),
              border: Border.all(color: onbordingBlue),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
