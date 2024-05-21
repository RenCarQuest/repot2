import '../../../data/data_sources/signup/signup_remote_data_source.dart';
import '../../../data/api/signup/register_body.dart';
import '../../../core/utils/results.dart';
import '../../../domain/repositories/signup/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  SignupRepositoryImpl(this._remoteDataSource);

  final SignupRemoteDataSource _remoteDataSource;

  @override
  Future<Result<void>> register(Register user) {
    return _remoteDataSource.register(user);
  }
}
