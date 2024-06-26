// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_interpolation_to_compose_strings
import 'dart:ui' as ui;
import 'package:carguru/controller/addlocation_controller.dart';
import 'package:carguru/helpar/routes_helper.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DelieryAddress2 extends StatefulWidget {
  const DelieryAddress2({super.key});

  @override
  State<DelieryAddress2> createState() => _DelieryAddress2State();
}

class _DelieryAddress2State extends State<DelieryAddress2> {
  AddLocationController addLocationController = Get.find();
  late GoogleMapController mapController;
  final List<Marker> _markers = <Marker>[];
  LatLng showLocation = LatLng(27.7089427, 85.3086209);

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
    loadData();
  }

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadData() async {
    final Uint8List markIcons = await getImages("assets/MapPin.png", 100);
    // makers added according to index
    _markers.add(
      Marker(
        // given marker id
        markerId: MarkerId("1"),
        // given marker icon
        icon: BitmapDescriptor.fromBytes(markIcons),
        // given position
        position: LatLng(
          addLocationController.lat,
          addLocationController.long,
        ),
        infoWindow: InfoWindow(),
      ),
    );
    setState(() {});
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
                text: '2',
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
      body: GetBuilder<AddLocationController>(builder: (context) {
        return Column(
          children: [
            Expanded(
              child: Container(
                width: Get.size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      addLocationController.lat,
                      addLocationController.long,
                    ), //initial position
                    zoom: 15.0, //initial zoom level
                  ),
                  markers: Set<Marker>.of(_markers),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  zoomGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                  onTap: (argument) async {
                    final Uint8List markIcons =
                        await getImages("assets/MapPin.png", 150);
                    // makers added according to index
                    _markers.add(
                      Marker(
                        // given marker id
                        markerId: MarkerId("1"),
                        // given marker icon
                        icon: BitmapDescriptor.fromBytes(markIcons),
                        // given position
                        position: LatLng(
                          argument.latitude,
                          argument.longitude,
                        ),
                        infoWindow: InfoWindow(),
                      ),
                    );
                    List<Placemark> addresses = await placemarkFromCoordinates(
                        argument.latitude, argument.longitude);
                    await placemarkFromCoordinates(
                            argument.latitude, argument.longitude)
                        .then((List<Placemark> placemarks) {
                      Placemark place = placemarks[0];
                      addLocationController.address =
                          '${placemarks.first.name!.isNotEmpty ? placemarks.first.name! + ', ' : ''}${placemarks.first.thoroughfare!.isNotEmpty ? placemarks.first.thoroughfare! + ', ' : ''}${placemarks.first.subLocality!.isNotEmpty ? placemarks.first.subLocality! + ', ' : ''}${placemarks.first.locality!.isNotEmpty ? placemarks.first.locality! + ', ' : ''}${placemarks.first.subAdministrativeArea!.isNotEmpty ? placemarks.first.subAdministrativeArea! + ', ' : ''}${placemarks.first.postalCode!.isNotEmpty ? placemarks.first.postalCode! + ', ' : ''}${placemarks.first.administrativeArea!.isNotEmpty ? placemarks.first.administrativeArea : ''}';
                      // addLocationController.address =
                      //     '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
                    });
                    addLocationController.getCurrentLatAndLong(
                      argument.latitude,
                      argument.longitude,
                    );
                    setState(() {});
                  },
                ),
                decoration: BoxDecoration(
                  color: WhiteColor,
                ),
              ),
            ),
            Container(
              height: 170,
              width: Get.size.width,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/location-crosshairs.png",
                        height: 20,
                        width: 20,
                        color: onbordingBlue,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Near".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          color: notifire.getwhiteblackcolor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    addLocationController.address.toString(),
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: FontFamily.gilroyMedium,
                      fontSize: 15,
                      color: notifire.getwhiteblackcolor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.addressDetailsScreen);
                    },
                    child: Container(
                      height: 50,
                      width: Get.size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Select & Proceed".tr,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyBold,
                              fontSize: 17,
                              color: WhiteColor,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: WhiteColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: onbordingBlue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: notifire.getbgcolor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(3.0, 0),
                    color: notifire.isDark ? greyScale : Colors.grey.shade300,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
