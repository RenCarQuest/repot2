import '../../../data/model/car_model/car_model.dart';
import '../../../domain/repositories/car_list/car_repository.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CarListUseCase {
  CarListUseCase(this._repository);

  final CarRepository _repository;

  Future<Result<List<CarModel>>> invoke() {
    return _repository.getCarList();
  }
}
