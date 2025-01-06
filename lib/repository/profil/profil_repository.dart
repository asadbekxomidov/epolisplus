import 'package:dio/dio.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_service.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:epolisplus/repository/profil/profil_repository_iml.dart';

class ProfilRepository extends ProfilRepositoryIml {
  late ApiService service;

  ProfilRepository() : service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);

  @override
  Future<BaseModels<ProfilResponse>> getProfile() async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.USER_INFORMATION;
    Response? response;

    try {
      response = await service.getGetData(headers, url);

      if (response?.statusCode == 200 && response?.data != null) {
        var responseData = response?.data;
        var profilData = ProfilResponse.fromJson(responseData);
        return BaseModels<ProfilResponse>(
          response: profilData,
          message: response?.statusMessage,
          status: response?.statusCode,
          code: response?.isRedirect,
        );
      } else {
        return BaseModels<ProfilResponse>(
          status: response?.statusCode,
          message: response?.statusMessage,
          response: null,
        );
      }
    } catch (e) {
      logger('Error Repository: $e', error: 'ProfilRepository');
      return BaseModels<ProfilResponse>(
        status: 500,
        message: 'An error occurred: $e',
        response: null,
      );
    }
  }

  @override
  Future<BaseModels> updateProfil(full_name) async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var data = {
      'full_name': full_name,
    };

    var url = ApiConstanta.UPDATE_USER_INFORMATION;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);
      logger(response.toString(), error: 'Update Profile Func');

      if (response?.statusCode == 200) {}
      return BaseModels(
        code: response?.isRedirect,
        message: response?.statusMessage,
        response: response?.data,
        status: response?.statusCode,
      );
    } catch (e) {
      return BaseModels(
        status: 512,
        message: e.toString(),
      );
    }
  }

  @override
  Future<BaseModels<CarInformationResponse>> getCarInformation(
    String teachPassportSeria,
    String teachPassportNumber,
    String govNumber,
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

    var data = {
      'techPassportSeria': teachPassportSeria,
      'techPassportNumber': teachPassportNumber,
      'govNumber': govNumber,
    };

    var url = ApiConstanta.GET_CAR_INFORMATION;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);

      logger(response.toString(), error: 'ProfilRepository');

      if (response?.statusCode == 200 && response?.data != null) {
        var responseData = response?.data['response'];
        if (responseData != null) {
          var profilData = CarInformationResponse.fromJson(responseData);

          return BaseModels<CarInformationResponse>(
            message: response?.statusMessage,
            response: profilData,
            status: response?.statusCode,
          );
        } else {
          return BaseModels<CarInformationResponse>(
            message: "Response data is null",
            status: response?.statusCode,
          );
        }
      } else {
        return BaseModels<CarInformationResponse>(
          message: response?.statusMessage ?? 'Error occurred',
          status: response?.statusCode,
        );
      }
    } catch (e) {
      print('Exception: $e');
      return BaseModels<CarInformationResponse>(
        status: 512,
        message: e.toString(),
      );
    }
  }

  @override
  Future<BaseModels> deleteCar(
    String govNumber,
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

    var data = {
      'car': govNumber,
    };

    var url = ApiConstanta.DELETE_CAR;
    Response? response;

    try {
      response = await service.getPostData(data, headers, url);
      logger(response.toString(), error: 'Delete Car Func');

      if (response?.statusCode == 200) {
        return BaseModels(
          message: response?.statusMessage,
          response: response?.data,
          status: response?.statusCode,
        );
      } else {
        return BaseModels(
          message: response?.statusMessage,
          response: response?.data,
          status: response?.statusCode,
        );
      }
    } catch (e) {
      return BaseModels(
        status: 512,
        message: e.toString(),
      );
    }
  }
}
