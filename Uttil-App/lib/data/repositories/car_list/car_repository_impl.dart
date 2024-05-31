import '../../../core/utils/results.dart';
import '../../../data/data_sources/car_list/car_list_remote_data_source.dart';
import '../../../data/model/car_model/car_model.dart';
import '../../../domain/repositories/car_list/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  CarRepositoryImpl(this._remoteDataSource);

  final CarListRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<CarModel>>> getCarList() {
    return _remoteDataSource.getCarList().then((result) {
      return result.map((cars) => cars.map((car) => CarModel.fromDto(car: car)).toList());
    });
  }
}
