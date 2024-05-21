import '../../../core/utils/results.dart';
import '../../../domain/models/onboarding/onboarding_model.dart';
import '../../../domain/repositories/onboarding/onboarding_repository.dart';
import 'package:flutter/widgets.dart';

import '../../data_sources/onboarding/onboarding_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this._dataSource);

  final OnboardingDataSource _dataSource;

  @override
  Future<Result<List<OnboardingModel>>> getOnboarding(BuildContext context) {
    return _dataSource.getOnboarding(context).then((result) {
      return result;
    });
  }
}
