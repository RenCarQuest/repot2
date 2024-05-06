import 'package:carguru/domain/models/onboarding_model.dart';
import 'package:injectable/injectable.dart';
import 'onboarding_data_source_impl.dart';
import '../../../core/utils/results.dart';


@lazySingleton
abstract class OnboardingDataSource {
  Future<Result<List<OnboardingModel>>> getOnboarding();

  @factoryMethod
  static OnboardingDataSource create() => OnboardingDataSourceImpl();
}
