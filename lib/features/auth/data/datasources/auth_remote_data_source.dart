import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import '../models/login_model.dart';
import '../models/signup_req_model.dart';
import '../models/signup_res_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({
    required String email,
    required String password,
  });

  Future<SignupResModel> signUp(SignupReqModel req);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.loginEndpoint,
      data: {
        "email": email,
        "password": password,
      },
    );
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<SignupResModel> signUp(SignupReqModel req) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.signupEndpoint,
      data: req.toJson(),
    );
    return SignupResModel.fromJson(response.data);
  }
}
