import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthEntity> login(String email, String password) async {
    final result = await remoteDataSource.login(email, password);

    // حفظ التوكن
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', result.accessToken);

    return result;
  }
}
