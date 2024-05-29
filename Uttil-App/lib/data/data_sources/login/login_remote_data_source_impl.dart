import '/core/utils/results.dart';
import '/data/api/login/login_api.dart';
import '/data/api/login/login_body.dart';
import '/data/data_sources/login/login_remote_data_source.dart';
import '/data/data_sources/network/safe_api_call.dart';
import '/data/dtos/login/login_dto.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl(this.api);

  final LoginApi api;

  @override
  Future<Result<LoginDto>> login(LoginBody user) {
    return safeApiCall(call: api.login(user: user));
  }
}
