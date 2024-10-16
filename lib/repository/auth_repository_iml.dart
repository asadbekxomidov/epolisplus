import '../models/base_models.dart';
import '../models/login/response/login_response.dart';

abstract class AuthRepositoryIml {
  Future<BaseModels<bool>> checkAuth(String phoneNumber);

  Future<BaseModels<LoginResponse>> login(String phoneNumber, String password);
}
