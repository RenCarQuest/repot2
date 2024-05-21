import '/data/api/signup/register_body.dart';
import '/core/config/config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api.g.dart';

@injectable
@RestApi()
abstract class SignUpApi {
  @factoryMethod
  factory SignUpApi(Dio dio) {
    return _SignUpApi(
      dio,
      baseUrl: config.baseUrl,
    );
  }

  @POST("/api/user/register")
  Future<void> register({
    @Body() required Register user,
  });
}
