import 'package:carguru/core/utils/results.dart';
import 'package:carguru/data/data_sources/onboarding/onboarding_data_source.dart';
import 'package:carguru/domain/models/onboarding/onboarding_model.dart';

import '../../../utils/App_content.dart';

class OnboardingDataSourceImpl implements OnboardingDataSource {
  OnboardingDataSourceImpl();

  @override
  Future<Result<List<OnboardingModel>>> getOnboarding() {
    return _mockData();
  }

  Future<Result<List<OnboardingModel>>> _mockData() async {
    return Future(() => Result.success([
      const OnboardingModel(title: "Lorem Ipsum1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", image: Appcontent.onbording1),
      const OnboardingModel(title: "Lorem Ipsum2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.", image: Appcontent.onbording2),
      const OnboardingModel(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", image: Appcontent.onbording3),
      const OnboardingModel(title: "Lorem Ipsum4", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", image: Appcontent.onbording2),
    ]));
  }
}
