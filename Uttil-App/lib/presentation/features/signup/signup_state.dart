part of 'signup_cubit.dart';

enum SignupStatus { initial, loading, success, failure }

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    required SignupStatus status,
    String? errorMessage,
  }) = _SignupState;

  factory SignupState.initial() {
    return const SignupState(
      status: SignupStatus.initial,
      errorMessage: '',
    );
  }
}
