// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:carguru/model/model.dart';
import 'package:carguru/screen/detailcar/payment_screen.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../utils/App_content.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late ColorNotifire notifire;
  late GoogleMapController mapController;
  bool isChecked = false;
  var revalue;
  int? covalue;

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
            child: Image.asset("assets/back.png", color: notifire.getwhiteblackcolor),
          ),
        ),
        centerTitle: true,
        title: Text("Address", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
        actions: [
          Icon(Icons.more_vert, color: notifire.getwhiteblackcolor),
          const SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: GestButton(
        height: 50,
        Width: Get.size.width,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        buttontext: "Confirm address",
        style: TextStyle(
          fontFamily: FontFamily.gilroyBold,
          color: WhiteColor,
          fontSize: 15,
        ),
        buttoncolor: onbordingBlue,
        onclick: () {
          Get.to(const PaymentsScreen());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
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
                    hintText: 'Find a address...',
                    hintStyle: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 16, color: notifire.getwhiteblackcolor),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Appcontent.search, height: 24, width: 24, color: notifire.getwhiteblackcolor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              address(),
            ],
          ),
        ),
      ),
    );
  }

  Widget address() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              revalue = index;
              covalue = index;
            });
          },
          child: Container(
            height: 104,
            width: Get.width,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: revalue == index ? Colors.transparent : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: revalue == index ? const Color(0xff7975ff) : Colors.grey.withOpacity(0.4))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 125,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: notifire.getborderColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(27.7089427, 85.3086209),
                          zoom: 15.0,
                        ),
                        mapType: MapType.normal,
                        myLocationEnabled: false,
                        compassEnabled: true,
                        zoomGesturesEnabled: true,
                        tiltGesturesEnabled: true,
                        zoomControlsEnabled: false,
                        onMapCreated: (controller) {
                          setState(() {
                            mapController = controller;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(model().addre[index], style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 16, color: notifire.getwhiteblackcolor, fontWeight: FontWeight.w700),),
                            const Spacer(),
                            Radio(
                              value: index,
                              fillColor: MaterialStateColor.resolveWith((states) =>
                              revalue == index ? const Color(0xff7975ff) : Colors.grey.shade400),
                              groupValue: revalue,
                              onChanged: (value) {
                                setState(() {
                                  revalue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Text(model().address[index], style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 12, color: greyScale, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis, maxLines: 1,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
