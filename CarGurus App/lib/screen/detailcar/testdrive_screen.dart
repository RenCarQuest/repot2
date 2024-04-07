// ignore_for_file: prefer_const_constructors, unused_field, avoid_print, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:carguru/screen/bottombar/bottombar_screen.dart';
import 'package:carguru/utils/App_content.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:carguru/utils/Custom_widget.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class TestDriveScreen extends StatefulWidget {
  const TestDriveScreen({super.key});

  @override
  State<TestDriveScreen> createState() => _TestDriveScreenState();
}

class _TestDriveScreenState extends State<TestDriveScreen> {
  late GoogleMapController mapController;

  DateTime _focusedDay = DateTime.now();
  TimeOfDay selectedtime = TimeOfDay.now();

  DateTime? _selectedDay;
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
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(12),
            child: Image.asset("assets/back.png", color: notifire.getwhiteblackcolor,),
          ),
        ),
        title: Text("Schedule a test drive", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
      ),
      bottomNavigationBar: GestButton(
        onclick: () {
          showModalBottomSheet(
            backgroundColor: notifire.getbgcolor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 437,
                  width: Get.width,
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Image.asset('assets/EmptyState.png', height: 96, width: 96,),
                      Spacer(),
                      Text("Thank you !", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 24, color: notifire.getwhiteblackcolor,),),
                      SizedBox(height: 15,),
                      Text("Awesome. You’re successfully\nscheduled your test drive.", style: TextStyle(fontFamily: FontFamily.gilroyMedium, fontSize: 16, color: greyScale1,),textAlign: TextAlign.center),
                      Spacer(),
                      GestButton(
                        height: 56,
                        buttontext: 'Return to Home',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: FontFamily.gilroyBold),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        buttoncolor: onbordingBlue,
                        onclick: () {
                         Get.to(BottomBarScreen());
                        },
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                );
              },
          );
        },
        height: 50,
        Width: Get.size.width,
        buttoncolor: onbordingBlue,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        buttontext: "Continue",
        style: TextStyle(
          fontFamily: FontFamily.gilroyBold,
          color: WhiteColor,
          fontSize: 15,
        ),
      ),
      body: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2050, 3, 14),
                focusedDay: _focusedDay,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    fontFamily: FontFamily.gilroyMedium,
                    color: notifire.getwhiteblackcolor,
                    fontSize: 15,
                  ),
                  leftChevronIcon: Image.asset("assets/chevron-left.png", height: 20, width: 20,),
                  rightChevronIcon: Image.asset("assets/chevron-right.png", height: 20, width: 20),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: notifire.getwhiteblackcolor,
                    fontFamily: FontFamily.gilroyMedium,
                  ),
                  weekendStyle: TextStyle(
                    color: notifire.getwhiteblackcolor,
                    fontFamily: FontFamily.gilroyMedium,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      color: onbordingBlue, shape: BoxShape.circle),
                  defaultTextStyle: TextStyle(
                    fontFamily: FontFamily.gilroyMedium,
                    color: notifire.getwhiteblackcolor,
                  ),
                  weekendTextStyle: TextStyle(
                    fontFamily: FontFamily.gilroyMedium,
                    color: notifire.getwhiteblackcolor,
                  ),
                  weekNumberTextStyle: TextStyle(
                    fontFamily: FontFamily.gilroyMedium,
                    color: notifire.getwhiteblackcolor,
                  ),
                ),
                calendarFormat: CalendarFormat.week,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: Get.size.height,
                width: Get.size.width,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Select a time", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 53,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: '${selectedtime.hour} : ${selectedtime.minute}',hintStyle: TextStyle(color: notifire.getwhiteblackcolor, fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 16),
                            suffixIcon: InkWell(
                                onTap: () async {
                                  final TimeOfDay? timeOfDay = await showTimePicker(
                                      context: context,
                                      initialTime: selectedtime);
                                  if(timeOfDay != null){
                                    setState(() {
                                      selectedtime = timeOfDay;
                                    });
                                  }
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(Appcontent.clock),
                                )),
                            focusColor: Colors.red,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))),
                            border:  OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.red))
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    Text("Your test drive will be", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 18, color: notifire.getwhiteblackcolor,),),
                    SizedBox(height: 15,),
                    Container(
                      height: 50,
                      width: Get.size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/map-pin.png",
                            height: 25,
                            width: 25,
                            color: notifire.getwhiteblackcolor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Filbert street, San Fransisco",
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyBold,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: notifire.isDark
                            ? Color(0xFF2A3646)
                            : Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      width: Get.size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                27.7089427, 85.3086209), //initial position
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: grey50),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: notifire.getblackwhitecolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
