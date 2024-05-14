import 'package:carguru/core/utils/results.dart';
import 'package:carguru/domain/models/onboarding/onboarding_model.dart';
import 'package:carguru/domain/repositories/onboarding/onboarding_repository.dart';
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
