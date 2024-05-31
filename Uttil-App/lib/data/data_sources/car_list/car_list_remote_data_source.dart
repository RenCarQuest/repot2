import '../../../data/api/car_list/car_list_api.dart';
import '../../../data/data_sources/car_list/car_list_remote_data_source_impl.dart';
import '../../../data/dtos/car_list/car_dto.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class CarListRemoteDataSource {
  Future<Result<List<CarDto>>> getCarList();

  @factoryMethod
  static CarListRemoteDataSource create({
    required final CarListApi api,
  }) =>
      CarListRemoteDataSourceImpl(api);
}
