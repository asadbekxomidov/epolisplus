import 'package:dio/dio.dart';
import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/models/login/response/login_response.dart';
import 'package:epolisplus/repository/auth_repository_iml.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/services/api_service.dart';

class AuthRepository extends AuthRepositoryIml {
  late ApiService service;

  AuthRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels<bool>> checkAuth(String phoneNumber) async {
    var headers = {
      'Content-type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {"phone": phoneNumber};

    var url = ApiConstanta.CHECK_AUTH;
    Response? response;
    try {
      response = await service.getPostData(data, headers, url);
      if (response?.statusCode != 200) {
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage,
          code: true,
        );
      } else {
        if (response?.data["status"] == 200) {
          bool isAuth = response?.data['response'];
          return BaseModels(
            status: 200,
            response: isAuth,
            code: true,
            message: '',
          );
        } else {
          return BaseModels(
            status: response?.data["status"],
            message: response?.statusMessage,
            code: true,
          );
        }
      }
    } on Exception {
      return BaseModels(
        status: 123,
        code: true,
        message:
            "server vaqtincha ishlamayapti, iltimos qaytadan urinib ko'ring",
      );
    }
  }

  @override
  Future<BaseModels<LoginResponse>> login(
      String phoneNumber, String password) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "phone": phoneNumber,
      "password": password,
      "username": phoneNumber,
    };

    var url = ApiConstanta.SIGN_IN;

    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      if (response?.statusCode != 200) {
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage,
          code: false,
        );
      } else {
        if (response?.data["status"] == 200) {
          var responseData = response?.data['response'];
          LoginResponse loginResponse = LoginResponse(
            responseData['access_token'],
            responseData['phone'],
            responseData['full_name'],
          );

          return BaseModels(
            status: 200,
            response: loginResponse,
            code: true,
            message: 'Login successful',
          );
        } else {
          return BaseModels(
            status: response?.data["status"],
            message: response?.data["message"] ?? 'Unknown error',
            code: false,
          );
        }
      }
    } on Exception catch (e) {
      return BaseModels(
        status: 123,
        code: false,
        message:
            "Server vaqtincha ishlamayapti, iltimos qaytadan urinib ko'ring: $e",
      );
    }
  }
}
