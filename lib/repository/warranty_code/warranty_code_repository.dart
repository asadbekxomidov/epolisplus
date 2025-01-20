import 'package:dio/dio.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';

import 'warranty_code_repository_iml.dart';

class WarrantyCodeRepository extends WarrantyCodeRepositoryIml {
  late ApiService service;

  WarrantyCodeRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels<ActivateCodeResponse>> warrantyInfo(String code) async {
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

      if (response?.statusCode == 200) {
        logger(response!.data.toString(), error: 'Status 200');

        var responseData = ActivateCodeResponse.fromJson(
          response.data['response'],
        );

        return BaseModels(
          response: responseData,
          status: response.statusCode,
          message: response.statusMessage,
        );
      } else {
        logger(response!.data.toString(), error: 'Error');
        return BaseModels(
          status: response.statusCode,
          message: response.statusMessage,
        );
      }
    } catch (e) {
      return BaseModels<ActivateCodeResponse>(
        message: e.toString(),
      );
    }
  }
}
