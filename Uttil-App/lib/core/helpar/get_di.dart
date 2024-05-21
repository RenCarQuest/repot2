import 'package:uttil/presentation/controller/addlocation_controller.dart';
import 'package:uttil/presentation/controller/cardetails_controller.dart';
import 'package:uttil/presentation/controller/carpurchase_controller.dart';
import 'package:uttil/presentation/controller/favorite_controller.dart';
import 'package:uttil/presentation/controller/home_controller.dart';
import 'package:uttil/presentation/controller/login_controller.dart';
import 'package:uttil/presentation/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => SignUpController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => FavoriteController());
  Get.lazyPut(() => CardetailsController());
  Get.lazyPut(() => CarPurchaseController());
  Get.lazyPut(() => AddLocationController());
}
