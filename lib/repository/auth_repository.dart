import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/models/login/response/login_response.dart';
import 'package:epolisplus/repository/auth_repository_iml.dart';

class AuthRepository extends AuthRepositoryIml {

  @override
  Future<BaseModels<bool>> checkAuth(String phoneNumber) async {




    return await BaseModels(200, true, "message", true);
  }

  @override
  Future<BaseModels<LoginResponse>> login(
      String phoneNumber, String password) async {
    return await BaseModels(200, true, "message", null);
  }
}
