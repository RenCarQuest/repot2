import '../../../core/utils/results.dart';
import '../../../data/api/login/login_body.dart';
import '../../../data/data_sources/login/login_remote_data_source.dart';
import '../../../domain/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this._remoteDataSource);

  final LoginRemoteDataSource _remoteDataSource;

  @override
  Future<Result<void>> login(LoginBody user) {
    return _remoteDataSource.login(user);
  }
}
