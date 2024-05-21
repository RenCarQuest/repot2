part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required List<OnboardingModel> onboardingList,
    required int currentPage,
    required bool isLoading,
    String? errorMessage,
  }) = _OnboardingState;

  factory OnboardingState.initial() {
    return const OnboardingState(
      currentPage: 0,
      errorMessage: '',
      onboardingList: [],
      isLoading: false,
    );
  }
}
