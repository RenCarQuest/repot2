import '../../../core/config/config.dart';
import '../../dtos/car_list/car_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'car_list_api.g.dart';

@injectable
@RestApi()
abstract class CarListApi {
  @factoryMethod
  factory CarListApi(Dio dio) {
    return _CarListApi(
      dio,
      baseUrl: config.baseUrl,
    );
  }

  @GET("/api/carDetail/all")
  Future<List<CarDto>> getCarList();
}
