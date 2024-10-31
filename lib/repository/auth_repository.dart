import 'package:dio/dio.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/repository/auth_repository_iml.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';

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

      if (response?.statusCode == 401) {
        // 401 - Token muddati o'tgan bo'lsa
        return BaseModels(
          status: 401,
          message: "Token muddati o'tdi, qayta kiring.",
          code: false,
        );
      } else if (response?.statusCode == 422) {
        String errorMessage = response?.data["response"]?["password"] ??
            "Noto‘g‘ri telefon raqami yoki parol";

        return BaseModels(
          status: 422,
          message: errorMessage,
          code: false,
        );
      } else if (response?.statusCode != 200) {
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage ?? "Xato yuz berdi",
          code: false,
        );
      } else {
        var responseData = response?.data['response'];

        LoginResponse loginResponse = LoginResponse(
          responseData['access_token'],
          responseData['phone'],
          responseData['full_name'],
        );

        // Tokenni saqlash
        final prefsManager = SharedPreferencesManager();
        await prefsManager.saveToken(responseData['access_token']);

        return BaseModels(
          status: 200,
          response: loginResponse,
          code: true,
          message: 'Login successful',
        );
      }
    } on Exception catch (e) {
      return BaseModels(
        status: 123,
        code: false,
        message: "Server bilan muammo: $e",
      );
    }
  }

  @override
  Future<BaseModels<RegisterResponse>> register(
    String? fullName,
    String phone,
    String password,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "full_name": fullName, // Ensure the full name is sent properly.
      "phone": phone,
      "email": "",
      "password": password,
      "password_repeat": password,
    };

    var url = ApiConstanta.SIGN_UP;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      print("${response?.statusCode}");
      if (response?.statusCode != 200) {
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage ?? 'Xato yuz berdi',
          code: false,
        );
      } else if (response?.statusCode == 200) {
        var responseData = response?.data['response'];
        //   print(responseData.toString());

        /*       if (responseData == null) {
          return BaseModels(
            status: 422,
            message: 'Serverdan to‘liq ma’lumot kelmadi',
            code: false,
          );
        }*/

        /*  RegisterResponse registerResponse = RegisterResponse(
          responseData['first_name'] ?? "",
          responseData['last_name'] ?? "",
          responseData['phone'] ?? "",
          responseData['email'] ?? "",
          password,
          passwordRepeat,
        );*/

        return BaseModels(
          status: 200,
          //    response: registerResponse,
          code: true,
          message: 'Sms junatildi',
        );
      } else {
        return BaseModels(
          status: response?.data["status"],
          message: response?.data["message"] ?? 'Noma\'lum xato',
          code: false,
        );
      }
    } on Exception catch (e) {
      return BaseModels(
        status: 123,
        code: false,
        message: "Server vaqtincha ishlamayapti, qaytadan urinib ko‘ring: $e",
      );
    }
  }

  @override
  Future<BaseModels<ConfitmAccountResponse>> confirmAccount(
    String phone,
    String code,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "phone": phone,
      "code": code,
    };

    var url = ApiConstanta.CONFIRM_ACCOUNT;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      if (response?.statusCode != 200) {
        // Agar status kodi 200 bo'lmasa, xato xabari qaytariladi
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage ?? 'Xato yuz berdi',
          code: false,
        );
      } else {
        if (response?.data["status"] == 200) {
          var responseData = response?.data['response'];

          ConfitmAccountResponse confirmResponse = ConfitmAccountResponse(
            responseData['phone'],
            responseData['code'],
          );

          return BaseModels(
            status: 200,
            response: confirmResponse,
            code: true,
            message: 'Hisob muvaffaqiyatli tasdiqlandi',
          );
        } else {
          return BaseModels(
            status: response?.data["status"],
            message: response?.data["message"] ?? 'Noma\'lum xato',
            code: false,
          );
        }
      }
    } on Exception catch (e) {
      return BaseModels(
        status: 123,
        code: false,
        message: "Server vaqtincha ishlamayapti, qaytadan urinib ko'ring: $e",
      );
    }
  }

  @override
  Future<BaseModels<ResendSmsResponse>> resendSms(String phone) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "phone": phone,
    };

    var url = ApiConstanta.RESEND_SMS_CODE; // SMS qayta jo‘natish API manzili
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      if (response?.statusCode != 200) {
        // Agar status kodi 200 bo'lmasa, xato qaytariladi
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage ?? 'Xato yuz berdi',
          code: false,
        );
      } else {
        if (response?.data["status"] == 200) {
          var responseData = response?.data['response'];

          ResendSmsResponse resendResponse = ResendSmsResponse(
            responseData['phone'],
          );

          return BaseModels(
            status: 200,
            response: resendResponse,
            code: true,
            message: 'SMS qayta jo\'natildi',
          );
        } else {
          return BaseModels(
            status: response?.data["status"],
            message: response?.data["message"] ?? 'Noma\'lum xato',
            code: false,
          );
        }
      }
    } on Exception catch (e) {
      // Aloqa muammosi yoki boshqa xato yuz berganda
      return BaseModels(
        status: 123,
        code: false,
        message:
            "Server vaqtincha ishlamayapti, iltimos qaytadan urinib ko'ring: $e",
      );
    }
  }

  @override
  Future<BaseModels<ForgotPasswordResponse>> forgotPassword(
      String phone) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "phone": phone,
    };

    var url = ApiConstanta.FORGET; // Parolni tiklash API manzili
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      if (response?.statusCode != 200) {
        // Xato holati uchun qaytarish
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage ?? 'Xato yuz berdi',
          code: false,
        );
      } else {
        if (response?.data["status"] == 200) {
          var responseData = response?.data['response'];

          ForgotPasswordResponse forgotPasswordResponse =
              ForgotPasswordResponse(
            responseData['phone'],
          );

          return BaseModels(
            status: 200,
            response: forgotPasswordResponse,
            code: true,
            message: 'Parolni tiklash uchun SMS yuborildi',
          );
        } else {
          return BaseModels(
            status: response?.data["status"],
            message: response?.data["message"] ?? 'Noma\'lum xato',
            code: false,
          );
        }
      }
    } on Exception catch (e) {
      // Exception holatlari uchun xabar
      return BaseModels(
        status: 123,
        code: false,
        message:
            "Server vaqtincha ishlamayapti, iltimos qaytadan urinib ko'ring: $e",
      );
    }
  }

  @override
  Future<BaseModels<ResetPasswordResponse>> resetPassword(
    String phone,
    String code,
    String password,
    String password_repeat,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "phone": phone,
      "code": code,
      "password": password,
      "password_repeat": password_repeat,
    };

    var url = ApiConstanta.RESET; // Parolni qayta o‘rnatish API manzili
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      if (response?.statusCode != 200) {
        // Xato holati uchun qaytarish
        return BaseModels(
          status: response!.statusCode,
          message: response.statusMessage ?? 'Xato yuz berdi',
          code: false,
        );
      } else {
        if (response?.data["status"] == 200) {
          var responseData = response?.data['response'];

          ResetPasswordResponse resetPasswordResponse = ResetPasswordResponse(
            responseData['phone'],
            responseData['code'],
            responseData['password'],
            responseData['password_repeat'],
          );

          return BaseModels(
            status: 200,
            response: resetPasswordResponse,
            code: true,
            message: 'Parol muvaffaqiyatli yangilandi',
          );
        } else {
          return BaseModels(
            status: response?.data["status"],
            message: response?.data["message"] ?? 'Noma\'lum xato',
            code: false,
          );
        }
      }
    } on Exception catch (e) {
      // Exception holatlari uchun xabar
      return BaseModels(
        status: 123,
        code: false,
        message:
            "Server vaqtincha ishlamayapti, iltimos qaytadan urinib ko'ring: $e",
      );
    }
  }

  Future<BaseModels> deleteAccount(
    String phone,
    String token,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "uz-UZ",
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
      // 'Content-type': 'application/json',
      // 'Content': 'application/json',
      // 'Accept-Language': '${PreferenceService().getLanguage()}',
      // 'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "phone": phone,
    };

    var url = ApiConstanta.DELETE_ACCOUNT;
    Response? response;
    try {
      response = await service.getPostData(data, headers, url);
      if (response?.statusCode != 200) {
        return BaseModels(
          status: response?.statusCode,
          // code: response?.statusCode,
          message: response?.statusMessage,
        );
      } else {
        if (response?.data["status"] == 200) {
          return BaseModels(
            status: 200
            // code: 200,
          );
        } else {
          return BaseModels(
            code: response?.data["status"],
            message: response?.statusMessage,
          );
        }
      }
    } on Exception {
      return throw 'SERVER_NOT_WORKING';
    }
  }
}
