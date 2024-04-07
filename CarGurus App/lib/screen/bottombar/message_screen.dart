import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/favorite_controller.dart';
import '../../utils/App_content.dart';
import '../../utils/Colors.dart';
import '../../utils/Dark_lightmode.dart';
import '../../utils/fontfameli_model.dart';
import '../message_screen/chat_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  FavoriteController favoriteController = Get.find();
  SingingCharacter? _character = SingingCharacter.a;
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
    favoriteController.changShimmer();
  }

  List img = [
    'assets/artist-1 1.png',
    'assets/artist-2 1.png',
    'assets/artist-3 1.png',
    'assets/artist-4 1.png',
    'assets/artist-5 1.png',
    'assets/artist-6 1.png',
    'assets/artist-7 1.png',
    'assets/artist-8 1.png',
    'assets/artist-3 1.png',
    'assets/artist-4 1.png',
  ];
  List text = [
    'M.S. Dhoni',
    'Alon musk',
    'Farrukh',
    'Popatlal',
    'Muatfa yeaf',
    'M.S. Dhoni',
    'Alon musk',
    'Farrukh',
    'Popatlal',
    'Muatfa yeaf',
  ];
  List subtext = [
    'Typing Message...',
    'perfect!',
    'just ideas for next time',
    'How are you?',
    "So, what's your plan this week...",
    'Typing Message...',
    'perfect!',
    'just ideas for next time',
    'How are you?',
    "So, what's your plan this week...",
  ];
  List time = [
    'Online',
    'Today',
    'Today',
    '27/01',
    '25/01',
    'Online',
    'Today',
    'Today',
    '27/01',
    '25/01',
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Text("Message", style: TextStyle(fontFamily: FontFamily.gilroyBold, fontSize: 15, color: notifire.getwhiteblackcolor,),),
        actions: [
          GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: notifire.getbgcolor,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return  SizedBox(
                        height: 253,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              ListTile(
                                leading: Text('Filter Results', style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                trailing: GestureDetector(
                                  onTap: () => Get.back(),
                                    child: Icon(Icons.close, size: 24, color: greyScale,)),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _character = SingingCharacter.a;
                                  });
                                },
                                child: ListTile(
                                  leading: Text('All messages', style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                  trailing: Radio(
                                    activeColor: onbordingBlue,
                                    value: SingingCharacter.a,
                                    groupValue: _character,
                                    onChanged: (value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _character = SingingCharacter.b;
                                  });
                                },
                                child: ListTile(
                                  leading: Text('Unread messages', style: TextStyle(fontSize: 18, fontFamily: FontFamily.gilroyBold, fontWeight: FontWeight.w700, color: notifire.getwhiteblackcolor,)),
                                  trailing: Radio(
                                    activeColor: onbordingBlue,
                                    value: SingingCharacter.b,
                                    groupValue: _character,
                                    onChanged: (value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox(height: 10,)),
                            ],
                          ),
                        ),
                      );
                    },);
                  },
                );
              },
              child: Icon(Icons.more_vert, size: 24, color: notifire.getwhiteblackcolor,)),
          const SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                    hintText: 'Search message',
                    hintStyle: TextStyle(fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, fontSize: 16, color: notifire.getwhiteblackcolor),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Appcontent.search, height: 24, width: 24,color: notifire.getwhiteblackcolor),
                    ),
                  ),
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 10,
                    thickness: 1,
                    color: Color(0xffF1F5F9),
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(ChatScreen(image: img[index], name: text[index], status: time[index],),);
                        },
                        child: ListTile(
                          leading: SizedBox(
                            height: 44,
                            width: 44,
                            child: Container(
                              height: 173,
                              width: Get.size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(img[index],), fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          title: Text(text[index], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.gilroyBold, color: notifire.getwhiteblackcolor)),
                          subtitle: Text(subtext[index], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.gilroyMedium, color: notifire.getwhiteblackcolor,)),
                          trailing: Text(time[index], style: TextStyle(fontSize: 12, fontFamily: FontFamily.gilroyMedium, fontWeight: FontWeight.w500, color: notifire.getwhiteblackcolor,),),
                        ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
enum SingingCharacter {a, b}