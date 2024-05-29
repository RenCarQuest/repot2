import '/data/api/login/login_api.dart';
import '/data/data_sources/login/login_remote_data_source_impl.dart';
import '/data/api/login/login_body.dart';
import '/data/dtos/login/login_dto.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRemoteDataSource {
  Future<Result<LoginDto>> login(LoginBody user);

  @factoryMethod
  static LoginRemoteDataSource create({
    required final LoginApi api,
  }) =>
      LoginRemoteDataSourceImpl(api);
}
