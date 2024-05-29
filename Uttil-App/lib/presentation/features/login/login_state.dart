part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failure }

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required LoginStatus status,
    String? errorMessage,
  }) = _LoginState;

  factory LoginState.initial() {
    return const LoginState(
      status: LoginStatus.initial,
      errorMessage: '',
    );
  }
}
