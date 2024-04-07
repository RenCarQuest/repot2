// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utils/Dark_lightmode.dart';

class OpencarScreen extends StatefulWidget {
  const OpencarScreen({super.key});

  @override
  State<OpencarScreen> createState() => _OpencarScreenState();
}

class _OpencarScreenState extends State<OpencarScreen> {
  late ColorNotifire notifire;
  @override
  void initState() {

    super.initState();
  }


  List<ImageProvider> imageList = <ImageProvider>[];
  bool imagePrecached = false;

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.25),
        onPressed: () {
          Get.back();
        },
        child: const Icon(Icons.close),
      ),

    );
  }

}
