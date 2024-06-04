import '../../core/l10n/extensions/app_localizations_context.dart';
import '../../core/constants/App_content.dart';
import '../../core/constants/Colors.dart';
import '../../core/utils/Dark_lightmode.dart';
import '../../core/utils/fontfameli_model.dart';
import '../../core/utils/number_format_utils.dart';
import '../../data/model/car_model/car_model.dart';
import '../../presentation/features/screen/detailcar/cardetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarVerticalItemWidget extends StatelessWidget {
  const CarVerticalItemWidget({
    super.key,
    required this.car,
    required this.notifire,
    required this.onFavoriteTap,
  });

  final CarModel car;
  final ColorNotifire notifire;
  final void Function()? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const CarDetailsScreen());
      },
      child: Container(
        height: 270,
        width: Get.size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: notifire.getborderColor),
          borderRadius: BorderRadius.circular(20),
          color: notifire.getblackwhitecolor,
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: car.availability ? accent : customGrey,
                  ),
                  child: Text(
                    car.availability
                        ? context.localization.carItemAvailableMsg
                        : context.localization.carItemNotAvailableMsg,
                    style: TextStyle(
                      fontFamily: FontFamily.dMSans,
                      fontWeight: FontWeight.w700,
                      color: customWhite,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: Image.asset(
                    Appcontent.heart,
                    height: 28,
                    width: 28,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 110,
              width: Get.size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(car.images.first),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text('${car.brand} ${car.model}',
                      style: TextStyle(
                        fontFamily: FontFamily.dMSans,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: notifire.getwhiteblackcolor,
                      )),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  Appcontent.star,
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 2),
                Text(
                  "4.8",
                  style: TextStyle(
                    fontFamily: FontFamily.lABGrotesk,
                    color: customGrey,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: customGrey,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  Appcontent.engine,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  car.fuelType,
                  style: TextStyle(
                    fontFamily: FontFamily.dMSans,
                    color: customGrey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  Appcontent.manualGearbox,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  car.transmissionType,
                  style: TextStyle(
                    fontFamily: FontFamily.dMSans,
                    color: customGrey,
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                Text(
                  NumberFormatUtils.formatPrice(car.rentalPricePerDay),
                  style: TextStyle(
                    fontFamily: FontFamily.lABGrotesk,
                    color: notifire.getwhiteblackcolor,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
