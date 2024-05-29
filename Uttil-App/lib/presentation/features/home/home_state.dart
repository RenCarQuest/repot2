part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required HomeStatus status,
    required List<CarModel> cars,
    String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      status: HomeStatus.initial,
      cars: [],
      errorMessage: '',
    );
  }
}
