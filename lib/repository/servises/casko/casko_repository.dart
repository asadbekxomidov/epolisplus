import 'package:dio/dio.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/models/servises_responses/responses/casko/casko_response.dart';

class CaskoRepository {
  late ApiService service;

  CaskoRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  Future<BaseModels> getCasko() async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'uz-UZ',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.KASKO_SERVICE;
    Response? response;

    try {
      response = await service.getGetData(headers, url);

      if (response?.statusCode == 200) {
        List<CaskoResponse> list = [];
        response?.data['response']
            .map((e) => list.add(CaskoResponse.fromJson(e)))
            .toList();
        return BaseModels(
          response: list,
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      } else {
        return BaseModels(
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      }
    } catch (e) {
      logger(response.toString(), error: '$e');
      return SERVER_NOT_WORKING;
    }
  }
}
