import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider()
      : _locale = !AppLocalizations.supportedLocales.contains(
                Locale(PlatformDispatcher.instance.locale.languageCode))
            ? AppLocalizations.supportedLocales.first
            : Locale(PlatformDispatcher.instance.locale.languageCode);

  Locale _locale;
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = AppLocalizations.supportedLocales.first;
    notifyListeners();
  }
}
