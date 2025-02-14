import 'package:dio/dio.dart';
import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:epolisplus/repository/servises/addiontal/addiontal_ser_repository_iml.dart';

class AddiontalSerRepository extends AddiontalSerRepositoryIml {
  late ApiService service;

  AddiontalSerRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels> getAddiSer() async {
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
        return BaseModels(
          status: response?.statusCode,
          response: response?.data['response'],
        );
      } else {
        return BaseModels(
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      }
    } catch (e) {
      return BaseModels(
        status: 512,
        message: '$e',
      );
    }
  }
}
