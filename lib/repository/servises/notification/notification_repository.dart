import 'package:dio/dio.dart';
import 'package:epolisplus/models/base_models.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:epolisplus/repository/servises/notification/notification_repository_iml.dart';

class NotificationRepository extends NotificationRepositoryIml {
  late ApiService service;

  NotificationRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels> getNotification() async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.GET_ALL_NOTIFICATION;
    Response? response;

    try {
      response = await service.getGetData(headers, url);

      if (response?.statusCode == 200) {
        List<NotificationResponse> list = [];
        response?.data['response']
            .map((e) => list.add(NotificationResponse.fromJson(e)))
            .toList();

        return BaseModels(
          response: list,
          status: response?.statusCode,
        );
      } else {
        return BaseModels(
          status: response?.statusCode,
          message: response!.data['message'],
        );
      }
    } catch (e) {
      return BaseModels(
        message: '$e',
        status: 512,
      );
    }
  }
}
