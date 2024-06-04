import '../../../presentation/widgets/car_vertical_item_widget.dart';
import '../../../presentation/controller/home_controller.dart';
import '../../../presentation/features/home/home_cubit.dart';
import '../../../presentation/features/screen/addlocation/location_screen.dart';
import '../../../presentation/features/screen/availablecar/availablecar_screen.dart';
import '../../../presentation/features/screen/availablecar/brandcar_screen.dart';
import '../../../presentation/features/screen/bottombar/brand_screen.dart';
import '../../../presentation/features/screen/detailcar/cardetails_screen.dart';
import '../../../data/model/model.dart';
import '../../../presentation/widgets/custom_widget.dart';
import '../../../core/l10n/extensions/app_localizations_context.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/utils/Dark_lightmode.dart';
import '../../../core/utils/fontfameli_model.dart';
import '../../../core/constants/App_content.dart';
import '../screen/message_screen/notification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List img = [
    Appcontent.tesla,
    Appcontent.toyota,
    Appcontent.bmw,
    Appcontent.lamborghini,
    Appcontent.ford,
  ];
  List logoname = [
    'Tesla',
    'Toyota',
    'BMW',
    'Lamborghini',
    'Ford',
  ];
  int favorite = 0;
  HomeController homeController = Get.find();
  late ColorNotifire notifire;

  _getdarkmodepreviousstate() async {
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
    _getdarkmodepreviousstate();
    super.initState();
    homeController.changShimmer();
    context.read<HomeCubit>().getCarList();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: LocationHeader(notifire: notifire),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        SearchField(notifire: notifire),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 55,
                          width: Get.size.width,
                          child: ListView.builder(
                            itemCount: model().catList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return state.status != HomeStatus.loading
                                  ? Container(
                                      height: 55,
                                      margin: const EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: notifire.getborderColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/car.png",
                                            height: 25,
                                            width: 25,
                                            color: notifire.getwhiteblackcolor,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            model().catList[index],
                                            style: TextStyle(
                                              fontFamily: FontFamily.dMSans,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color:
                                                  notifire.getwhiteblackcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : categoryShimmer();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              context.localization.homeRecommendationTitle,
                              style: TextStyle(
                                fontFamily: FontFamily.dMSans,
                                fontWeight: FontWeight.w700,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Get.to(() => const AvailablecarScreen());
                              },
                              child: Text(
                                context.localization.viewAllMessage,
                                style: TextStyle(
                                  fontFamily: FontFamily.dMSans,
                                  fontWeight: FontWeight.w500,
                                  color: customGrey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          itemCount: state.status == HomeStatus.loading
                              ? 1
                              : state.cars.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return state.status != HomeStatus.loading
                                ? CarVerticalItemWidget(
                                    notifire: notifire,
                                    car: state.cars[index],
                                    onFavoriteTap: () {
                                      favorite = index;
                                    },
                                  )
                                : carRecomendationShimmer(notifire);
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              context.localization.homeTopBrands,
                              style: TextStyle(
                                fontFamily: FontFamily.dMSans,
                                fontWeight: FontWeight.w700,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => const Brand1Screen());
                                },
                                child: Text(
                                  context.localization.viewAllMessage,
                                  style: TextStyle(
                                    fontFamily: FontFamily.dMSans,
                                    fontWeight: FontWeight.w500,
                                    color: customGrey,
                                    fontSize: 15,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 120,
                          width: Get.size.width,
                          child: ListView.builder(
                            itemCount: img.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return state.status != HomeStatus.loading
                                  ? Container(
                                      height: 120,
                                      width: 93,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: notifire.getborderColor),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      notifire.getborderColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: index == 2
                                                ? Image.asset(
                                                    img[2],
                                                    color: Colors.black,
                                                  )
                                                : Image.asset(img[index]),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            logoname[index],
                                            style: TextStyle(
                                              fontFamily: FontFamily.dMSans,
                                              color:
                                                  notifire.getwhiteblackcolor,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : topBrandShimmer();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              context.localization.homeRecommendationTitle,
                              style: TextStyle(
                                fontFamily: FontFamily.dMSans,
                                fontWeight: FontWeight.w600,
                                color: notifire.getwhiteblackcolor,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => const AvailablecarScreen());
                                },
                                child: Text(
                                  context.localization.viewAllMessage,
                                  style: TextStyle(
                                    fontFamily: FontFamily.dMSans,
                                    fontWeight: FontWeight.w500,
                                    color: customGrey,
                                    fontSize: 15,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 260,
                          width: Get.size.width,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return state.status != HomeStatus.loading
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(() => const CarDetailsScreen());
                                      },
                                      child: Container(
                                        height: 260,
                                        width: 228,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: notifire.getborderColor),
                                          color: notifire.getblackwhitecolor,
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/Audi.png",
                                                  height: 15,
                                                  width: 50,
                                                ),
                                                const Spacer(),
                                                Image.asset(
                                                  "assets/images/heart.png",
                                                  height: 25,
                                                  width: 28,
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 110,
                                              width: Get.size.width,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/audiCar.png"),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Audi A8 Quattro",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FontFamily.dMSans,
                                                          fontWeight: FontWeight.w700,
                                                      fontSize: 15,
                                                      color: notifire
                                                          .getwhiteblackcolor,
                                                    ),
                                                  ),
                                                ),
                                                Image.asset(
                                                  "assets/images/star.png",
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  "4.8",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.lABGrotesk,
                                                    color: customGrey,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Divider(
                                              color: greyScale,
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/engine.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "Automatic",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.dMSans,
                                                    color: customGrey,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "\$112,150.00",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.lABGrotesk,
                                                    fontSize: 12,
                                                    color: accent,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : carRecomendationUpShimmer();
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  categoryShimmer() {
    return Container(
      height: 55,
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: notifire.getborderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
        baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
        highlightColor:
            notifire.isDark ? const Color(0xFF475569) : const Color(0xFFeaeff4),
        enabled: true,
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: notifire.getblackwhitecolor,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 15,
              width: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: notifire.getblackwhitecolor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  topBrandShimmer() {
    return Container(
      height: 120,
      width: 93,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: notifire.getborderColor),
        borderRadius: BorderRadius.circular(20),
        color: notifire.getblackwhitecolor,
      ),
      child: Shimmer.fromColors(
        baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
        highlightColor:
            notifire.isDark ? const Color(0xFF475569) : const Color(0xFFeaeff4),
        enabled: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 15,
              width: 70,
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  carRecomendationUpShimmer() {
    return Container(
      height: 260,
      width: 228,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: notifire.getborderColor),
        color: notifire.getblackwhitecolor,
      ),
      child: Shimmer.fromColors(
        baseColor: notifire.isDark ? Colors.black45 : Colors.grey.shade100,
        highlightColor:
            notifire.isDark ? const Color(0xFF475569) : const Color(0xFFeaeff4),
        enabled: true,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  Appcontent.heart,
                  height: 25,
                  width: 28,
                ),
              ],
            ),
            Container(
              height: 110,
              width: Get.size.width,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: greyScale,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.notifire,
  });

  final ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const BrandScreen());
      },
      child: Container(
        height: 50,
        width: Get.size.width,
        decoration: BoxDecoration(
          color: notifire.getblackwhitecolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            Text(
              context.localization.homeSearchBarHint,
              style: TextStyle(
                fontFamily: FontFamily.dMSans,
                color: greyColor,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Image.asset(
              Appcontent.search,
              height: 25,
              width: 25,
              color: notifire.getwhiteblackcolor,
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}

class LocationHeader extends StatelessWidget {
  const LocationHeader({
    super.key,
    required this.notifire,
  });

  final ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.size.width,
      color: notifire.getbgcolor,
      child: Row(
        children: [
          const SizedBox(width: 2),
          GestureDetector(
            onTap: () {
              Get.to(() => const LocationScreen());
            },
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: notifire.getborderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                Appcontent.mapPin,
                height: 25,
                width: 25,
                color: notifire.getwhiteblackcolor,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.localization.homeLocationTitle,
                  style: TextStyle(
                    fontFamily: FontFamily.dMSans,
                    color: customGrey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "San Fransisco",
                  style: TextStyle(
                    fontFamily: FontFamily.dMSans,
                    fontWeight: FontWeight.w600,
                    color: notifire.getwhiteblackcolor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => const NotificationScreen()),
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: notifire.getborderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                Appcontent.notification,
                height: 25,
                width: 25,
                color: notifire.getwhiteblackcolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
