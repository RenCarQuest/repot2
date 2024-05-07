import 'package:carguru/core/utils/results.dart';
import 'package:carguru/domain/models/onboarding_model.dart';
import 'package:carguru/domain/repositories/onboarding/onboarding_repository.dart';

import '../../data_sources/onboarding/onboarding_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this._dataSource);

  final OnboardingDataSource _dataSource;

  @override
  Future<Result<List<OnboardingModel>>> getOnboarding() {
    return _dataSource.getOnboarding().then((result) {
      return result;
    });
  }
}
