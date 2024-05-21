import 'package:uttil/data/data_sources/onboarding/onboarding_data_source.dart';
import 'package:uttil/data/repositories/onboarding/onboarding_repository_impl.dart';
import 'package:uttil/domain/models/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/results.dart';

@lazySingleton
abstract class OnboardingRepository {
  Future<Result<List<OnboardingModel>>> getOnboarding(BuildContext context);

  @factoryMethod
  static OnboardingRepository create({
    required final OnboardingDataSource dataSource,
  }) =>
      OnboardingRepositoryImpl(dataSource);
}
