import 'package:epolisplus/models/models_export.dart';

abstract class AuthRepositoryIml {
  Future<BaseModels<bool>> checkAuth(String phoneNumber);

  Future<BaseModels<LoginResponse>> login(String phoneNumber, String password);

  Future<BaseModels<RegisterResponse>> register(
    String fullName,
    String phone,
    String password,
  );

  Future<BaseModels<ConfitmAccountResponse>> confirmAccount(
    String phone,
    String code,
  );

  Future<BaseModels<ResendSmsResponse>> resendSms(String phone);

  Future<BaseModels<ForgotPasswordResponse>> forgotPassword(String phone);

  Future<BaseModels<ResetPasswordResponse>> resetPassword(
    String phone,
    String code,
    String password,
    String password_repeat,
  );

  Future<BaseModels> deleteAccount(String phone, String token);
}
