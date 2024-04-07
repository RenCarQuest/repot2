// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_typing_uninitialized_variables
import 'package:carguru/controller/addlocation_controller.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryAddress1 extends StatefulWidget {
  const DeliveryAddress1({super.key});

  @override
  State<DeliveryAddress1> createState() => _DeliveryAddress1State();
}

class _DeliveryAddress1State extends State<DeliveryAddress1> {
  AddLocationController addLocationController = Get.find();
  TextEditingController searchLocation = TextEditingController();

  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  var newlatlang;
  String location = "Search for your delivery address".tr;

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  late ColorNotifire notifire;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    getdarkmodepreviousstate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
          color: notifire.getwhiteblackcolor,
        ),
        title: Text(
          "Add Your delivery address".tr,
          maxLines: 1,
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            color: notifire.getwhiteblackcolor,
            fontSize: 17,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 40,
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(
                text: '1',
                style: TextStyle(
                  color: notifire.getwhiteblackcolor,
                  fontFamily: FontFamily.gilroyBold,
                  fontSize: 17,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '/3',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        color: notifire.getbgcolor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
              },
              child: Container(
                height: 50,
                width: Get.size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/Search.png",
                        height: 20,
                        width: 20,
                        color: Color(0xFF636268),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      location.toString(),
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        fontSize: 16,
                        color: greyScale,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                LocationPermission permission;
                permission = await Geolocator.checkPermission();
                permission = await Geolocator.requestPermission();
                if (permission == LocationPermission.denied) {}
                var currentLocation = await locateUser();
                debugPrint('location: ${currentLocation.latitude}');
                List<Placemark> addresses = await placemarkFromCoordinates(
                    currentLocation.latitude, currentLocation.longitude);
                await placemarkFromCoordinates(
                        currentLocation.latitude, currentLocation.longitude)
                    .then((List<Placemark> placemarks) {
                  Placemark place = placemarks[0];
                  addLocationController.address =
                      '${placemarks.first.name!.isNotEmpty ? placemarks.first.name! + ', ' : ''}${placemarks.first.thoroughfare!.isNotEmpty ? placemarks.first.thoroughfare! + ', ' : ''}${placemarks.first.subLocality!.isNotEmpty ? placemarks.first.subLocality! + ', ' : ''}${placemarks.first.locality!.isNotEmpty ? placemarks.first.locality! + ', ' : ''}${placemarks.first.subAdministrativeArea!.isNotEmpty ? placemarks.first.subAdministrativeArea! + ', ' : ''}${placemarks.first.postalCode!.isNotEmpty ? placemarks.first.postalCode! + ', ' : ''}${placemarks.first.administrativeArea!.isNotEmpty ? placemarks.first.administrativeArea : ''}';
                });
                addLocationController.getCurrentLatAndLong(
                  currentLocation.latitude,
                  currentLocation.longitude,
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/location-crosshairs.png",
                    height: 25,
                    width: 25,
                    color: notifire.getwhiteblackcolor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Get current location with GPS".tr,
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyMedium,
                      color: notifire.getwhiteblackcolor,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
