import '../../domain/entities/auth_tokens_entity.dart';

class LoginModel extends AuthTokensEntity {
  const LoginModel({
    super.accessToken,
    super.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
