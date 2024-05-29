import '../../../data/api/signup/register_body.dart';
import '../../../data/api/signup/signup_api.dart';
import '../../../data/data_sources/signup/signup_remote_data_source_impl.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class SignupRemoteDataSource {
  Future<Result<void>> register(Register user);

  @factoryMethod
  static SignupRemoteDataSource create({
    required final SignUpApi api,
  }) =>
      SignupRemoteDataSourceImpl(api);
}
