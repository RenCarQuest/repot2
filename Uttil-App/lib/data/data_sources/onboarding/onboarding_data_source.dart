import 'package:uttil/domain/models/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'onboarding_data_source_impl.dart';
import '../../../core/utils/results.dart';


@lazySingleton
abstract class OnboardingDataSource {
  Future<Result<List<OnboardingModel>>> getOnboarding(BuildContext context);

  @factoryMethod
  static OnboardingDataSource create() => OnboardingDataSourceImpl();
}
