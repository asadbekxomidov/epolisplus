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
      'Content': 'ason',
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

      if (response?.statusCode == 200 && response?.data != null) {
        var responseData = response?.data['response'];

        if (responseData != null) {
          var profilData = CarInformationResponse.fromJson(responseData);
          profilData.govNum = govNumber;
          profilData.techSeria = teachPassportSeria;
          profilData.techNumber = teachPassportNumber;
          return BaseModels<CarInformationResponse>(
            message: response?.statusMessage,
            response: profilData,
            status: response?.statusCode,
          );
        }
      } else if (response?.statusCode == 500) {
        return BaseModels(
          message: response?.statusMessage,
        );
      }

      return BaseModels<CarInformationResponse>(
        message: response?.statusMessage,
        status: response?.statusCode,
      );
    } catch (e) {
      print('Exception: $e');
      return BaseModels<CarInformationResponse>(
        status: 512,
        message: e.toString(),
      );
    }
  }

  @override
  Future<BaseModels<CarInformationResponse>> addUserCar(
      Map<String, dynamic> carData) async {
    final prefsManager = SharedPreferencesManager();
    final token = await prefsManager.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Content': 'application/json',
      'Accept-Language': 'ru-RU',
      'Accept-Encoding': 'UTF-8',
      'Authorization': 'Bearer $token',
    };

    var url = ApiConstanta.ADD_MY_CAR;
    Response? response;

    try {
      response = await service.getPostData(carData, headers, url);

      if (response?.statusCode == 200) {
        return BaseModels(
          status: response?.statusCode,
          message: response?.statusMessage,
        );
      } else {
        return BaseModels(
          message: response?.statusMessage,
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



/*



{
  "link": "v1/osgo/vehicle",
  "headers": {
    "Content-Type": "application/json",
    "Content": "application/json",
    "Accept-Language": "ru-RU",
    "Accept-Encoding": "UTF-8",
    "Authorization": "Bearer vKmpRoRMhyxdtlTskNGCAaxXtqtPCb33Fr5XEC3PpSHlln2SBs8bGxaftsmmNuou"
  },
  "data": {
    "techPassportSeria": "AAG",
    "techPassportNumber": "3334805",
    "govNumber": "10V535LA"
  },
  "response": {
    "status": 200,
    "code": false,
    "message": "BIRTHDAY INFORMATION",
    "response": {
      "ERROR": "0",
      "ERROR_MESSAGE": "",
      "TECH_PASSPORT_ISSUE_DATE": "19.01.2024",
      "ISSUE_YEAR": "2010",
      "VEHICLE_TYPE_ID": "1",
      "BODY_NUMBER": "XWB5M31BDAA037013",
      "ENGINE_NUMBER": "F18D31854281",
      "MODEL_ID": "4578#2$1498",
      "MARKA_ID": "13",
      "MODEL_NAME": "LACETTI",
      "ORGNAME": "RUSTAMOV KOMILJON XOMITOVICH",
      "LAST_NAME": "RUSTAMOV",
      "FIRST_NAME": "KOMILJON",
      "MIDDLE_NAME": "XOMITOVICH",
      "USE_TERRITORY": "2",
      "FY": "0",
      "PINFL": "31504794170072",
      "INN": "",
      "SEATS": "5",
      "VEHICLE_TYPE_NAME": "Легковые автомобили",
      "VEHICLE_TERRITORY_ID": "2",
      "REGION_NAME": "Ташкентский область",
      "PASSPORT_SERIES": "",
      "PASSPORT_NUMBER": "",
      "PASSPORT_ISSUED_BY": "",
      "PASSPORT_ISSUE_DATE": "",
      "BIRTHDAY": "15.04.1979",
      "ADDRESS": ""
    }
  }
}



 */