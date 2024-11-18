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
  Future<BaseModels<QuestionAnswerResponse>> questionAnswerGet(
    String title,
    String summary,
  ) async {
    final prefsManager = SharedPreferencesManager();
    final token = prefsManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU', // Tilni kerak bo'lsa "uz-UZ" ga o'zgartiring
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.FAQ;
    Response? response;

    try {
      // API chaqiruvi
      var response = await service.getGetData(headers, url);
      logger(response.toString(), error: 'QuestionAnswerRepository');

      // Javobni tekshirish
      if (response?.statusCode == 200 && response?.data != null) {
        final data = response?.data['response'] as List;

        logger(response?.data, error: 'QuestionAnswerRepository');
        // JSONni modellashtirish
        List<QuestionAnswerResponse> questionAnswers =
            data.map((item) => QuestionAnswerResponse.fromJson(item)).toList();

        // Kiritilgan title va summary asosida qidiruv
        final filteredAnswers = questionAnswers.where((qa) {
          return qa.title.contains(title) && qa.summary.contains(summary);
        }).toList();

        if (filteredAnswers.isNotEmpty) {
          // Birinchi topilgan natijani qaytarish
          return BaseModels<QuestionAnswerResponse>(
            status: response?.statusCode,
            code: true,
            message: "Data fetched successfully",
            response: filteredAnswers.first,
          );
        } else {
          // Mos keladigan natija topilmasa
          return BaseModels<QuestionAnswerResponse>(
            status: response?.statusCode,
            code: false,
            message: "No matching data found",
            response: null,
          );
        }
      } else {
        // Xato yoki bo'sh javob qaytsa
        return BaseModels<QuestionAnswerResponse>(
          status: response?.statusCode,
          code: false,
          message: response?.statusMessage,
          response: null,
        );
      }
    } catch (e) {
      // Istisno yuzaga kelganda
      return BaseModels<QuestionAnswerResponse>(
        status: 500, // Xato kod, masalan, server xatosi
        code: false,
        message: "Error occurred: $e",
        response: null,
      );
    }
  }
}
