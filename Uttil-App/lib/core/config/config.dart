import 'dart:convert';

import 'package:uttil/core/di/di.dart';
import 'package:flutter/services.dart';

Config get config => sl<Config>();

class Config {
  const Config({
    required this.baseUrl,
  });

  Config._(Map<String, dynamic> config)
      : baseUrl = config['baseUrl'];

  static Future<void> initialize() async {
    final configJsonString = await rootBundle.loadString('config/config.json');
    final json = jsonDecode(configJsonString) as Map<String, dynamic>;
    sl.registerLazySingleton<Config>(() => Config._(json));
  }

  final String baseUrl;
}
