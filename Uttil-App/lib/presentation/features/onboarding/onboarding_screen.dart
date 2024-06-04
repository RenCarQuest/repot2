import 'package:uttil/core/l10n/extensions/app_localizations_context.dart';
import 'package:uttil/presentation/features/faq/faq_screen.dart';
import 'package:uttil/presentation/features/onboarding/onboarding_cubit.dart';
import 'package:uttil/presentation/features/login/login_screen.dart';
import 'package:uttil/core/constants/App_content.dart';
import 'package:uttil/core/constants/Colors.dart';
import 'package:uttil/presentation/widgets/custom_widget.dart';
import 'package:uttil/core/utils/Dark_lightmode.dart';
import 'package:uttil/core/utils/fontfameli_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  late ColorNotifire notifire;

  @override
  void initState() {
    getDarkModePreviousState();
    super.initState();
    context.read<OnboardingCubit>().getOnboarding(context);
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state.errorMessage != null) {
            return Text(state.errorMessage!);
          } else {
            return Stack(
              children: [
                Container(
                  height: Get.size.height,
                  width: Get.size.width,
                  color: state.currentPage == 0 ? BlackColor : onbordingBlue,
                  child: PageView.builder(
                    physics: const ClampingScrollPhysics(),
                    controller: pageController,
                    itemCount: state.onboardingList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: index == 2
                            ? const EdgeInsets.only(left: 20)
                            : EdgeInsets.zero,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage(state.onboardingList[index].image),
                            fit: index == 0 ? BoxFit.cover : null,
                          ),
                        ),
                      );
                    },
                    onPageChanged: (value) {
                      setState(() {
                        context.read<OnboardingCubit>().setPageIndex(value);
                      });
                    },
                  ),
                ),
                state.currentPage != state.onboardingList.length - 1
                    ? _pageIndicatorSection(state.currentPage, state.onboardingList.length)
                    : const SizedBox(),
                state.currentPage == state.onboardingList.length - 1
                    ? Positioned(
                        top: Get.size.height * 0.08,
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Appcontent.logo),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              context.localization.appTitle,
                              style: TextStyle(
                                fontFamily: FontFamily.nebulasSemiBold,
                                fontSize: 32,
                                color: WhiteColor,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Positioned(
                  top: Get.size.height * 0.12,
                  width: Get.size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.onboardingList[state.currentPage].title,
                          style: TextStyle(
                            fontFamily: FontFamily.nebulasMedium,
                            color: WhiteColor,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.onboardingList[state.currentPage].description,
                          style: TextStyle(
                            fontFamily: FontFamily.dMSans,
                            color: greyScale,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: _footerSection(state.currentPage, state.onboardingList.length - 1),
                )
              ],
            );
          }
        },
      ),
    );
  }

  getDarkModePreviousState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  Widget _buildPageIndicator(int currentIndex, int totalPages) {
    List<Widget> list = [];

    for (int i = 0; i < totalPages; i++) {
      list.add(_buildPageIndicatorItem(currentIndex == i));
      if (i != totalPages - 1) {
        list.add(const SizedBox(width: 10));
      }
    }

    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
    return row;
  }

  Widget _buildPageIndicatorItem(bool isCurrentIndicator) {
    return Container(
      width: isCurrentIndicator ? 30 : 8,
      height: isCurrentIndicator ? 7 : 8,
      decoration: BoxDecoration(
          color: isCurrentIndicator ? WhiteColor : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget _footerSection(int index, int lastIndex) {
    if (index != lastIndex) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageButton(
            height: 30,
            width: Get.size.width * 0.8,
            spacing: 20,
            image: Appcontent.question,
            buttonText: context.localization.helpCenterFooterContactButton,
            style: TextStyle(
              fontFamily: FontFamily.dMSans,
              color: WhiteColor,
              fontSize: 16,
            ),
            onTap: () {
              Get.to(const FaqScreen());
            },
          ),
          const SizedBox(height: 20),
          GestButton(
            height: 50,
            Width: Get.size.width,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            buttoncolor: index == 0 ? onbordingBlue : WhiteColor,
            buttontext: context.localization.generalGetStartedButton,
            style: TextStyle(
              fontFamily: FontFamily.gilroyBold,
              color: index == 0 ? WhiteColor : onbordingBlue,
              fontSize: 15,
            ),
            onclick: () {
              pageController.jumpToPage(index + 1);
            },
          ),
        ],
      );
    } else {
      return Column(
        children: [
          GestButton(
            height: 50,
            Width: Get.size.width,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            buttoncolor: WhiteColor,
            buttontext: context.localization.onboardingEmailButton,
            style: TextStyle(
              fontFamily: FontFamily.dMSans,
              fontWeight: FontWeight.bold,
              color: onbordingBlue,
              fontSize: 15,
            ),
            onclick: () {
              Get.to(() => const LoginScreen());
            },
          ),
        ],
      );
    }
  }

  Widget _pageIndicatorSection(int currentIndex, int totalPages) {
    return Positioned(
      top: Get.size.height * 0.06,
      left: 0,
      right: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 15),
          _buildPageIndicator(currentIndex, totalPages),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                pageController.jumpToPage(totalPages - 1);
              });
            },
            child: Text(
              context.localization.generalSkip,
              style: TextStyle(
                fontFamily: FontFamily.dMSans,
                fontWeight: FontWeight.w600,
                color: currentIndex == 0 ? onbordingBlue : WhiteColor,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
