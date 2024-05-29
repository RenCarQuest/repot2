import '../../../domain/use_cases/login/login_use_case.dart';
import '../../../presentation/widgets/alert_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginState.initial());

  final LoginUseCase _loginUseCase;

  Future<void> loginUser(String email, String password) async {
    AlertMessage.showLoading();
    final result = await _loginUseCase.invoke(email, password);
    AlertMessage.hideLoading();

    if (result.isFailure) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: result.error.toString(),
      ));
    } else {
      emit(state.copyWith(
        status: LoginStatus.success,
        errorMessage: null,
      ));
    }
  }
}
