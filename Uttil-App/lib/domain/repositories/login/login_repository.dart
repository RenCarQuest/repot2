import '../../../data/data_sources/login/login_remote_data_source.dart';
import '../../../data/repositories/login/login_repository_impl.dart';
import '../../../data/api/login/login_body.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  Future<Result<void>> login(LoginBody user);

  @factoryMethod
  static LoginRepository create({
    required final LoginRemoteDataSource remoteDataSource,
  }) =>
      LoginRepositoryImpl(remoteDataSource);
}
