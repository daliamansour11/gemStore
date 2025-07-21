import '../entities/auth_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<AuthEntity> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
