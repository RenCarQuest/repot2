import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_model.freezed.dart';

@freezed
class OnboardingModel with _$OnboardingModel {
  const factory OnboardingModel({
    required String title,
    required String description,
    required String image,
  }) = _OnboardingModel;
}
