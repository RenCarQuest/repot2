import 'package:uttil/domain/models/onboarding/onboarding_model.dart';
import 'package:uttil/domain/use_cases/onboarding/get_onboarding_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._getOnboardingUseCase)
      : super(OnboardingState.initial());

  final GetOnboardingUseCase _getOnboardingUseCase;

  void setPageIndex(int newIndex) {
    emit(state.copyWith(currentPage: newIndex));
  }

  Future<void> getOnboarding(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getOnboardingUseCase.invoke(context);
    if (result.isFailure) {
      emit(state.copyWith(
        errorMessage: result.error.toString(),
        isLoading: false,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        onboardingList: result.data!,
        errorMessage: null,
      ));
    }
  }
}
