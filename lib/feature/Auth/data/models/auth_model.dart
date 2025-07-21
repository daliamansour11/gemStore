import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({required String accessToken}) : super(accessToken: accessToken);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(accessToken: json['access_token']);
  }
}
