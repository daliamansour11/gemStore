import 'package:dio/dio.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/auth_model.dart';

class AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSource({required this.api});

  Future<AuthModel> login(String email, String password) async {
    try {
      final response = await api.post(
        EndPoints.baseUrl + EndPoints.login,
        body: {'email': email, 'password': password},
      );
      return AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception("Login Failed: ${e.response?.data["message"] ?? e.message}");
    }
  }
}
