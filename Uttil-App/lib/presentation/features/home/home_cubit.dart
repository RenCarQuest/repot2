import '../../../presentation/widgets/alert_message.dart';
import '../../../data/model/car_model/car_model.dart';
import '../../../domain/use_cases/car_list/car_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'dart:math';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._carListUseCase) : super(HomeState.initial());

  final CarListUseCase _carListUseCase;

  Future<void> getCarList() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final result = await _carListUseCase.invoke();

    if (result.isFailure) {
      AlertMessage.showErrorMessage(result.error.toString(), null);
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: result.error.toString(),
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.success,
        cars: result.data!.sublist(0, min(10, result.data!.length)),
        errorMessage: null,
      ));
    }
  }
}
