import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/services/api_service.dart';

class PartnersRepository {
  final ApiService _service;

  PartnersRepository()
      : _service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);

  Future<BaseModels<List<PartnersResponse>>> getPartners(
      int id, String site, String phone, String image) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "ru-RU",
      'Accept-Encoding': 'UTF-8',
    };

    var url = ApiConstanta.GET_PARTNERS;

    try {
      final response = await _service.getGetData(headers, url);

      if (response?.statusCode == 200) {
        final responseData = response?.data['response'] as List;
        final partners =
            responseData.map((e) => PartnersResponse.fromJson(e)).toList();
        return BaseModels<List<PartnersResponse>>(
          status: 200,
          message: 'Success',
          code: true,
          response: partners,
        );
      } else {
        return BaseModels<List<PartnersResponse>>(
          status: response?.statusCode ?? 500,
          message: response?.statusMessage ?? 'Unknown error',
          code: false,
          response: [],
        );
      }
    } catch (e) {
      return BaseModels<List<PartnersResponse>>(
        status: 500,
        code: false,
        message: 'Server error: $e',
        response: [],
      );
    }
  }
}
