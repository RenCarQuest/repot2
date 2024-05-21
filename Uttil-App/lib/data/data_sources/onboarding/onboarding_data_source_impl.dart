import 'package:uttil/core/l10n/extensions/app_localizations_context.dart';
import 'package:uttil/core/utils/results.dart';
import 'package:uttil/data/data_sources/onboarding/onboarding_data_source.dart';
import 'package:uttil/domain/models/onboarding/onboarding_model.dart';
import 'package:flutter/widgets.dart';

import '../../../core/constants/App_content.dart';

class OnboardingDataSourceImpl implements OnboardingDataSource {
  OnboardingDataSourceImpl();

  @override
  Future<Result<List<OnboardingModel>>> getOnboarding(BuildContext context) {
    return _mockData(context);
  }

  Future<Result<List<OnboardingModel>>> _mockData(BuildContext context) async {
    return Future(() => Result.success([
      OnboardingModel(title: context.localization.onboardingTitle1, description: context.localization.onboardingBody1, image: Appcontent.onbording1),
      OnboardingModel(title: context.localization.onboardingTitle2, description: context.localization.onboardingBody2, image: Appcontent.onbording2),
      OnboardingModel(title: context.localization.onboardingTitle3, description: context.localization.onboardingBody3, image: Appcontent.onbording3),
      OnboardingModel(title: context.localization.onboardingTitle4, description: context.localization.onboardingBody4, image: Appcontent.onbording2),
    ]));
  }
}
