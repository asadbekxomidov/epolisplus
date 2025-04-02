import 'package:dio/dio.dart';
import 'warranty_code_repository_iml.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';

class WarrantyCodeRepository extends WarrantyCodeRepositoryIml {
  late ApiService service;

  WarrantyCodeRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels<ActivateCodeResponse>> activateCodeInfo(String code) async {
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

  @override
  Future<BaseModels<List<WarrantycodeResponse>>> warrantyCodeGet() async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.WARRANTY_TYPE_LIST;
    Response? response;

    try {
      response = await service.getGetData(headers, url);

      if (response?.statusCode == 200) {
        var warrantyList = (response?.data["response"] as List)
            .map((item) => WarrantycodeResponse.fromJson(item))
            .toList();

        return BaseModels(
          response: warrantyList,
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      } else {
        return BaseModels(
          response: response?.data,
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      }
    } catch (e) {
      loggerF(response.toString(), error: 'AAA $e');
      return BaseModels(
        message: '$e',
        status: 512,
      );
    }
  }
}
