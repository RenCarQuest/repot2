import '../../../data/data_sources/car_list/car_list_remote_data_source.dart';
import '../../../data/repositories/car_list/car_repository_impl.dart';
import '../../../data/model/car_model/car_model.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class CarRepository {
  Future<Result<List<CarModel>>> getCarList();

  @factoryMethod
  static CarRepository create({
    required final CarListRemoteDataSource remoteDataSource,
  }) =>
      CarRepositoryImpl(remoteDataSource);
}
