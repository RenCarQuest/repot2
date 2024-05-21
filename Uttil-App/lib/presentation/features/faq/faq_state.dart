part of 'faq_cubit.dart';

@freezed
class FaqState with _$FaqState {
  const factory FaqState({
    required List<FaqModel> faqs,
    required bool isLoading,
    String? errorMessage,
  }) = _FaqState;

  factory FaqState.initial() {
    return const FaqState(
      faqs: [],
      isLoading: false,
    );
  }
}
