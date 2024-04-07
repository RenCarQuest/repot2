// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:carguru/helpar/routes_helper.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:carguru/helpar/get_di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Gilroy",
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        ),
        initialRoute: Routes.initial,
        getPages: getPages,
      ),
    ),
  );
}
