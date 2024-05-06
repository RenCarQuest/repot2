import 'package:carguru/data/data_sources/onboarding/onboarding_data_source.dart';
import 'package:carguru/data/repositories/onboarding/onboarding_repository_impl.dart';
import 'package:carguru/domain/models/onboarding_model.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/results.dart';

@lazySingleton
abstract class OnboardingRepository {
  Future<Result<List<OnboardingModel>>> getOnboarding();

  @factoryMethod
  static OnboardingRepository create({
    required final OnboardingDataSource dataSource,
  }) =>
      OnboardingRepositoryImpl(dataSource);
}
