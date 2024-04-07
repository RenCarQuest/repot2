// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:carguru/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyCarDetailsScreen extends StatefulWidget {
  const BuyCarDetailsScreen({super.key});

  @override
  State<BuyCarDetailsScreen> createState() => _BuyCarDetailsScreenState();
}

class _BuyCarDetailsScreenState extends State<BuyCarDetailsScreen> {
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

    );
  }

  detailsRow({String? title, price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            title ?? "",
            style: TextStyle(
              fontFamily: FontFamily.gilroyMedium,
              fontSize: 15,
              color: notifire.getwhiteblackcolor,
            ),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(
              fontFamily: FontFamily.gilroyBold,
              fontSize: 15,
              color: notifire.getwhiteblackcolor,
            ),
          ),
        ],
      ),
    );
  }
}
