import '../../../core/utils/results.dart';
import '../../../domain/models/onboarding/onboarding_model.dart';
import 'onboarding_data_source_impl.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
abstract class OnboardingDataSource {
  Future<Result<List<OnboardingModel>>> getOnboarding(BuildContext context);

  @factoryMethod
  static OnboardingDataSource create() => OnboardingDataSourceImpl();
}
