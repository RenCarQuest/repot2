import '../core/config/config.dart';
import '../core/helpar/get_di.dart' as di;
import '../core/di/di.dart';
import '../core/providers/locale_provider.dart';
import '../core/helpar/routes_helper.dart';
import '../core/utils/Dark_lightmode.dart';
import '../presentation/features/onboarding/onboarding_cubit.dart';
import '../presentation/features/faq/faq_cubit.dart';
import '../presentation/features/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bot_toast/bot_toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Config.initialize();
  await di.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final localeProvider = Provider.of<LocaleProvider>(context);

          return MultiBlocProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ColorNotifire()),
              BlocProvider<FaqCubit>(create: (_) => sl<FaqCubit>()),
              BlocProvider<OnboardingCubit>(create: (_) => sl<OnboardingCubit>()),
              BlocProvider<SignupCubit>(create: (_) => sl<SignupCubit>()),
            ],
            child: GetMaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: localeProvider.locale,
              debugShowCheckedModeBanner: false,
              builder: BotToastInit(),
              navigatorObservers: [BotToastNavigatorObserver()],
              theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: "Gilroy",
              ),
              initialRoute: Routes.initial,
              getPages: getPages,
            ),
          );
        },
      );
}
