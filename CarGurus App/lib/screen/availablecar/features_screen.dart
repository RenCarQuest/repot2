import 'package:carguru/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/Custom_widget.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  late ColorNotifire notifire;
  var select = [];
  List text = [
    'Interior Equipment',
    'Multimedia',
    'Exterior Equipments',
  ];
  List multimedia = [
    'Android Auto',
    'Apple Carplay',
    'Dab Radio',
    'Head Up Display',
    'On-board Computer',
    'Navigation System',
    'WLAN/Wifi Hotspot',
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: BottomAppBar(
          elevation: 0,
          height: 50,
          color: notifire.getbgcolor,
          child: GestButton(
            height: 50,
            Width: Get.size.width,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            buttontext: 'Done',
            style: const TextStyle(fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
            onclick: () {},
            buttoncolor: onbordingBlue,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, color: notifire.getwhiteblackcolor,)),
        title: Text('Features', style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 18, color: notifire.getwhiteblackcolor,),),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('Clear', style: TextStyle(fontFamily: 'gilroyMedium', fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xffFF4747),),),
          ),
          SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: text.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: notifire.getborderColor, width: 1),
                    ),
                    child: index == 1 ? Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: notifire.getwhiteblackcolor,
                        title: Text(text[index], style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 16, color: notifire.getwhiteblackcolor),),
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: multimedia.length,
                            itemBuilder: (context, index) {
                              final theme = Theme.of(context);
                              final oldCheckboxTheme = theme.checkboxTheme;
                              final newCheckBoxTheme = oldCheckboxTheme.copyWith(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                              );
                              return Theme(
                                data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
                                child: CheckboxListTile(
                                  side: MaterialStateBorderSide.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return const BorderSide(color: Colors.cyan,width: 2);
                                      }
                                      return BorderSide(color: greyScale,width: 2);
                                    },
                                  ),
                                  title: Text(multimedia[index], style: TextStyle(fontFamily: 'gilroyMedium',fontSize: 14, color: notifire.getwhiteblackcolor,fontWeight: FontWeight.w500)),
                                  activeColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.all(5),
                                  checkColor: Colors.blue,
                                  dense: true,
                                  value: select.contains(index) ? true : false,
                                  controlAffinity: ListTileControlAffinity.leading,
                                  onChanged: (bool? value) {
                                    if (select.contains(index)) {
                                      setState(() {
                                        select.remove(index);
                                      });
                                    } else {
                                      setState(() {
                                        select.add(index);
                                      });
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ) : Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: notifire.getwhiteblackcolor,
                        title: Text(text[index], style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 16, color: notifire.getwhiteblackcolor),),
                        children: <Widget>[
                          ListTile(title: Text(text[index], style: TextStyle(fontFamily: 'gilroyBold', fontWeight: FontWeight.w700, fontSize: 16, color: notifire.getwhiteblackcolor),),),
                        ],
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
