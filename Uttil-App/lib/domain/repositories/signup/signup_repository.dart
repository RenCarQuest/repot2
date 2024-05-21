import '../../../data/data_sources/signup/signup_remote_data_source.dart';
import '../../../data/repositories/signup/signup_repository_impl.dart';
import '../../../data/api/signup/register_body.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class SignupRepository {
  Future<Result<void>> register(Register user);

  @factoryMethod
  static SignupRepository create({
    required final SignupRemoteDataSource remoteDataSource,
  }) =>
      SignupRepositoryImpl(remoteDataSource);
}
