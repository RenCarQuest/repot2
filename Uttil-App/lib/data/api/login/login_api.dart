import '../../dtos/login/login_dto.dart';
import '/core/config/config.dart';
import '/data/api/login/login_body.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'login_api.g.dart';

@injectable
@RestApi()
abstract class LoginApi {
  @factoryMethod
  factory LoginApi(Dio dio) {
    return _LoginApi(
      dio,
      baseUrl: config.baseUrl,
    );
  }

  @POST("/api/user/login")
  Future<LoginDto> login({
    @Body() required LoginBody user,
  });
}
