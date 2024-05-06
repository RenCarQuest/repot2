import 'package:carguru/core/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final sl = GetIt.instance;

@injectableInit
void configureDependencies() => sl.init();
