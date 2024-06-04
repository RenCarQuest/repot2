import '../../../presentation/features/screen/bottombar/favorite_screen.dart';
import '../home/home_screen.dart';
import '../../../presentation/features/screen/bottombar/message_screen.dart';
import '../../../presentation/features/screen/bottombar/profile_screen.dart';
import '../../../core/constants/App_content.dart';
import '../../../core/l10n/extensions/app_localizations_context.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/utils/Dark_lightmode.dart';
import '../../../core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  late ColorNotifire notifire;
  List<Widget> myChilders = [
    const HomeScreen(),
    const FavoriteScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  _getDarkModePreviousState() async {
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
    _getDarkModePreviousState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: notifire.getbgcolor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: greyScale1,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontFamily: FontFamily.dMSans,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        fixedColor: onbordingBlue,
        unselectedLabelStyle: const TextStyle(
          fontFamily: FontFamily.dMSans,
          fontWeight: FontWeight.w500,
        ),
        currentIndex: currentIndex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              Appcontent.homeOutline,
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              Appcontent.homeBold,
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: context.localization.bottomNavigationHomeItem,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Appcontent.favoriteOutline,
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              Appcontent.favoriteBold,
              color: onbordingBlue,
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: context.localization.bottomNavigationFavoritesItem,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Appcontent.messageOutline,
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              Appcontent.messageBold,
              color: onbordingBlue,
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: context.localization.bottomNavigationMessageItem,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Appcontent.profileOutline,
              color: greyScale1,
              height: MediaQuery.of(context).size.height / 35,
            ),
            activeIcon: Image.asset(
              Appcontent.profileBold,
              color: onbordingBlue,
              height: MediaQuery.of(context).size.height / 35,
            ),
            label: context.localization.bottomNavigationProfileItem,
          ),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: myChilders[currentIndex],
    );
  }
}
