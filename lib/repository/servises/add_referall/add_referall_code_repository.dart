import 'package:dio/dio.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/utils/utils_export.dart';

class AddReferallCodeRepository {
  late ApiService service;

  AddReferallCodeRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  Future<BaseModels> getRefCode(String refCode) async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'uz-UZ',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var data = {
      'code': refCode,
    };

    var url = ApiConstanta.CHECK_REFERRAL;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      if (response?.statusCode == 200) {
        return BaseModels(
          response: response?.data,
          status: response?.statusCode,
        );
      } else {
        return BaseModels(
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      }
    } catch (e) {
      return SERVER_NOT_WORKING;
    }
  }
}
