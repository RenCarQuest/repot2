import 'package:carguru/domain/models/onboarding_model.dart';
import 'package:carguru/domain/repositories/onboarding/onboarding_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/results.dart';

@lazySingleton
class GetOnboardingUseCase {
  GetOnboardingUseCase(this._onboardingRepository);

  final OnboardingRepository _onboardingRepository;

  Future<Result<List<OnboardingModel>>> invoke() {
    return _onboardingRepository.getOnboarding();
  }
}
