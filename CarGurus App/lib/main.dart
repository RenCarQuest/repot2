// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:carguru/core/providers/locale_provider.dart';
import 'package:carguru/helpar/routes_helper.dart';
import 'package:carguru/utils/Dark_lightmode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:carguru/helpar/get_di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final localeProvider = Provider.of<LocaleProvider>(context);

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ColorNotifire()),
          ],
          child: GetMaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: localeProvider.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: "Gilroy",
            ),
            initialRoute: Routes.initial,
            getPages: getPages,
          ),
        );
      });
}
