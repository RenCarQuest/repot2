import '../../../data/api/signup/register_body.dart';
import '../../../domain/repositories/signup/signup_repository.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignupUseCase {
  SignupUseCase(this._repository);

  final SignupRepository _repository;

  Future<Result<void>> invoke(String name, String email, String password) {
    return _repository.register(Register(name: name, email: email, password: password));
  }
}
