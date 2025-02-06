import 'package:dio/dio.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:epolisplus/repository/user_info/user_info_repository_iml.dart';

class UserInfoRepository extends UserInfoRepositoryIml {
  late ApiService service;

  UserInfoRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels> userInfo(
      String seria, String pasportId, String birthDate) async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var data = {
      'passportSeries': seria,
      'passportNumber': pasportId,
      'birthDate': birthDate,
    };

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.USER_GET_INFO;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      if (response?.statusCode == 200 && response?.data != null) {
        logger(response.toString(), error: 'UserInfoRepository');
        return BaseModels(
          response: UserInfoResponse.fromJson(response?.data['response']),
          // response: response?.data,
          message: response?.statusMessage,
          status: response?.statusCode,
        );
      } else {
        return BaseModels(
          response: response?.data,
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      }
    } catch (e) {
      return BaseModels(
        message: '$e',
        status: response?.statusCode,
      );
    }
  }
}
