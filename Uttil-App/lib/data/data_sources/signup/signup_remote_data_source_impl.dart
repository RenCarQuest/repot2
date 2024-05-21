import '../../../core/utils/results.dart';
import '../../../data/api/signup/register_body.dart';
import '../../../data/api/signup/signup_api.dart';
import '../../../data/data_sources/signup/signup_remote_data_source.dart';
import '../network/safe_api_call.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  SignupRemoteDataSourceImpl(this.api);

  final SignUpApi api;

  @override
  Future<Result<void>> register(Register user) {
    return safeApiCall(call: api.register(user: user));
  }
}
