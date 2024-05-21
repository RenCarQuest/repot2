import '../../../core/utils/results.dart';
import '../../../domain/models/onboarding/onboarding_model.dart';
import '../../../domain/repositories/onboarding/onboarding_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOnboardingUseCase {
  GetOnboardingUseCase(this._onboardingRepository);

  final OnboardingRepository _onboardingRepository;

  Future<Result<List<OnboardingModel>>> invoke(BuildContext context) {
    return _onboardingRepository.getOnboarding(context);
  }
}
