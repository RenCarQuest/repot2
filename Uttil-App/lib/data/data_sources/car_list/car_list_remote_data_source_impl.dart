import '../../../core/utils/results.dart';
import '../../../data/api/car_list/car_list_api.dart';
import '../../../data/data_sources/car_list/car_list_remote_data_source.dart';
import '../../../data/data_sources/network/safe_api_call.dart';
import '../../../data/dtos/car_list/car_dto.dart';

class CarListRemoteDataSourceImpl implements CarListRemoteDataSource {
  CarListRemoteDataSourceImpl(this.api);

  final CarListApi api;

  @override
  Future<Result<List<CarDto>>> getCarList() {
    return safeApiCall(call: api.getCarList());
  }
}
