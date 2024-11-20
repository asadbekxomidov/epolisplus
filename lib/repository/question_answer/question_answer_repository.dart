import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/models/question_answer_model/question_answer_response.dart';
import 'package:epolisplus/repository/question_answer/question_answer_repository_iml.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:get/get_connect/http/src/response/response.dart';

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
      var response = await service.getGetData(headers, url);
      logger('${response?.data}', error: 'QuestionAnswerRepository');
      print('${response?.data}');
      print('111111111111111111111111');

      if (response?.statusCode == 200) {
        var data = response?.data['response'];
        print(data.toString());
        print('222222222222222222222222');

        if (data != null) {
          print(data);
          print('33333333333333333333');
          print(data.runtimeType);
          print('44444444444444444444');
          print(data.toString());
          print('5555555555555555555555');

          if (data.isNotEmpty) {
            print('${data}');
            print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
            print(response?.statusCode);
            print('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');
            print(response.runtimeType);
            print('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC');
            print(data);
            print('IIIIIIIIIIIIIIIIIIIIIIIIIIIiIIIIIIII');
            print(response?.data);
            return BaseModels<List<QuestionAnswerResponse>>(
              status: response?.statusCode,
              code: false,
              message: response?.statusMessage,
              response: response?.data,
            );
          } else {
            print('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
            return BaseModels<List<QuestionAnswerResponse>>(
              status: response?.statusCode,
              code: false,
              message: response?.statusMessage,
              response: null,
            );
          }
        } else {
          print('666666666666666666666666');
          return BaseModels<List<QuestionAnswerResponse>>(
            status: response?.statusCode,
            code: false,
            message: "Invalid data format",
            response: null,
          );
        }
      } else {
        print('7777777777777777777777777777');
        return BaseModels<List<QuestionAnswerResponse>>(
          status: response?.statusCode,
          code: false,
          message: response?.statusMessage ?? 'Unknown error',
        );
      }
    } catch (e) {
      // logger('Error occurred: $e', error: 'QuestionAnswerRepository');
      return BaseModels<List<QuestionAnswerResponse>>(
        status: 500,
        code: false,
        message: "Error occurred: $e",
        response: null,
      );
    }
  }
}
