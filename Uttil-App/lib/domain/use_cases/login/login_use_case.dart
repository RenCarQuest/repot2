import '../../../data/api/login/login_body.dart';
import '../../../domain/repositories/login/login_repository.dart';
import '../../../core/utils/results.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  LoginUseCase(this._repository);

  final LoginRepository _repository;

  Future<Result<void>> invoke(String email, String password) {
    return _repository.login(LoginBody(email: email, password: password));
  }
}
