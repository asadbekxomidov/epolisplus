import 'package:dio/dio.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/utils/utils_export.dart';

import 'warranty_code_repository_iml.dart';

class WarrantyCodeRepository extends WarrantyCodeRepositoryIml {
  late ApiService service;

  WarrantyCodeRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels> warrantyInfo(String code) async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var data = {
      'code': code,
    };

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.ACTIVATE_QRCODE;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);
      logger(response.toString(), error: 'WarrantyCodeRepository');

      if (response?.statusCode == 200) {
        return BaseModels(
          response: response?.data,
          status: response?.statusCode,
          message: response?.statusMessage,
        );
        // } else if (response?.statusCode == 401) {
        //   await prefsManager.clearUserInfo();
        //   return BaseModels(
        //     message: response?.statusMessage,
        //     status: response?.statusCode,
        //   );
      } else {
        return BaseModels(
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      }
    } catch (e) {
      return BaseModels(
        message: e.toString(),
      );
    }
  }
}
