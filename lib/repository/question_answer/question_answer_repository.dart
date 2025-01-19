import 'package:dio/dio.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/models/question_answer_model/question_answer_response.dart';
import 'package:epolisplus/repository/question_answer/question_answer_repository_iml.dart';

class QuestionAnswerRepository extends QuestionAnswerRepositoryIml {
  late ApiService service;

  QuestionAnswerRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels<List<QuestionAnswerResponse>>> questionAnswerGet(
    String title,
    String summary,
  ) async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.FAQ;
    Response? response;

    try {
      response = await service.getGetData(headers, url);
      logger('${response?.data}', error: 'QuestionAnswerRepository');

      if (response?.statusCode == 200) {
        var data = response?.data['response'];
        var responseData = response?.data['response'];
        List<QuestionAnswerResponse> qaList = (responseData as List)
            .map((partner) => QuestionAnswerResponse.fromJson(partner))
            .toList();
        return BaseModels(
          status: response?.statusCode,
          code: false,
          message: response?.statusMessage,
          response: qaList,
        );
      } else {
        return BaseModels<List<QuestionAnswerResponse>>(
          status: response?.statusCode,
          code: false,
          message: response?.statusMessage ?? 'Unknown error',
        );
      }
    } catch (e) {
      return BaseModels<List<QuestionAnswerResponse>>(
        status: 500,
        code: false,
        message: "Error occurred: $e",
        response: null,
      );
    }
  }
}
