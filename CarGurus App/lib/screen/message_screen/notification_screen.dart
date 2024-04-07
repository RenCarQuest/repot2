import 'package:carguru/model/model.dart';
import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/App_content.dart';
import '../../utils/Dark_lightmode.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late ColorNotifire notifire;
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
          child: Icon(Icons.arrow_back, color:  notifire.getwhiteblackcolor,),
        ),
        centerTitle: true,
        title: Text('Notifications', style: TextStyle(fontSize: 18, fontFamily: 'GilroyBold', fontWeight: FontWeight.w600, color:  notifire.getwhiteblackcolor,),),
        actions: [
          Image.asset(Appcontent.checks, height: 24, width: 24,),
          const SizedBox(width: 15,),
          Icon(Icons.more_vert, size: 24, color: notifire.getwhiteblackcolor,),
          const SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Today', style: TextStyle(fontSize: 14, fontFamily: 'GilroyBold', fontWeight: FontWeight.w600, color:  notifire.getwhiteblackcolor,),),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                itemCount: model().img.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, -15),
                            child: Image.asset(model().img[index], height: 48, width: 48,)),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model().text[index], style: TextStyle(fontSize: 14, fontFamily: 'GilroyBold', fontWeight: FontWeight.w600, color:  notifire.getwhiteblackcolor,),),
                            const SizedBox(height: 10,),
                            Text(model().subtext[index], style: TextStyle(fontSize: 14, fontFamily: 'GilroyMedium', fontWeight: FontWeight.w600, color:  greyScale,),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Image.asset(Appcontent.clock, height: 16, width: 16, color: greyScale,),
                                const SizedBox(width: 10,),
                                Text(model().time[index], style: TextStyle(fontSize: 12, fontFamily: 'GilroyMedium', fontWeight: FontWeight.w600, color:  greyScale,),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
              },),
              Text('This Week', style: TextStyle(fontSize: 14, fontFamily: 'GilroyBold', fontWeight: FontWeight.w600, color:  notifire.getwhiteblackcolor,),),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                itemCount: model().img.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Transform.translate(
                            offset: const Offset(0, -15),
                            child: Image.asset(model().img[index], height: 48, width: 48,)),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model().text[index], style: TextStyle(fontSize: 14, fontFamily: 'GilroyBold', fontWeight: FontWeight.w600, color:  notifire.getwhiteblackcolor,),),
                            const SizedBox(height: 10,),
                            Text(model().subtext[index], style: TextStyle(fontSize: 14, fontFamily: 'GilroyMedium', fontWeight: FontWeight.w600, color:  greyScale,),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Image.asset(Appcontent.clock, height: 16, width: 16, color: greyScale,),
                                const SizedBox(width: 10,),
                                Text(model().time1[index], style: TextStyle(fontSize: 12, fontFamily: 'GilroyMedium', fontWeight: FontWeight.w600, color:  greyScale,),),
                              ],
                            ),
                          ],
                        ),
                      ],
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
