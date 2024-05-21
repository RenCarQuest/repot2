import '../../widgets/alert_message.dart';
import '../../../domain/use_cases/signup/signup_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupUseCase) : super(SignupState.initial());

  final SignupUseCase _signupUseCase;

  Future<void> registerUser(String name, String email, String password) async {
    final result = await _signupUseCase.invoke(name, email, password);
    AlertMessage.hideLoading();

    if (result.isFailure) {
      emit(state.copyWith(
        status: SignupStatus.failure,
        errorMessage: result.error.toString(),
      ));
    } else {
      emit(state.copyWith(
        status: SignupStatus.success,
        errorMessage: null,
      ));
    }
  }
}
