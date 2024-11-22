import 'package:dio/dio.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/repository/partners/partners_repository_iml.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/services/api_service.dart';

// class PartnersRepository extends PartnersRepositoryIml {
//   late ApiService service;

//   PartnersRepository() {
//     service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
//   }

//   @override
//   Future<BaseModels<List<PartnersResponse>>> getPartners(
//       int id, String site, String phone, String image) async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept-Language': "ru-RU",
//       'Accept-Encoding': 'UTF-8',
//     };

//     var data = {
//       "phone": phone,
//     };

//     var url = ApiConstanta.GET_PARTNERS;

//     Response? response;
//     print('object1, Repository');

//     try {
//       // Request for partner data
//       print('object2, Repository');
//       response = await service.getPostData(data, headers, url);

//       if (response?.statusCode != 200) {
//         print('object3, Repository');
//         // Return an error if the status code is not 200
//         return BaseModels<List<PartnersResponse>>(
//           status: response!.statusCode,
//           message: response.statusMessage ?? 'An error occurred',
//           code: false,
//           response: [],
//         );
//       } else {
//         print('object4, Repository');
//         if (response?.data["status"] == 200) {
//           // If the status is 200, process the response data
//           var responseData = response?.data['response'];
//           List<PartnersResponse> partners = (responseData as List)
//               .map((partner) => PartnersResponse.fromJson(partner))
//               .toList();
//           print('object5, Repository');

//           logger(partners.toString(), error: "Partners Repository");

//           return BaseModels<List<PartnersResponse>>(
//             status: 200,
//             message: 'Partners list fetched successfully',
//             code: true,
//             response: partners,
//           );
//         } else {
//           return BaseModels<List<PartnersResponse>>(
//             status: response?.data["status"],
//             message: response?.data["message"] ?? 'Unknown error',
//             code: false,
//             response: [],
//           );
//         }
//       }
//     } on Exception catch (e) {
//       return BaseModels<List<PartnersResponse>>(
//         status: 123,
//         code: false,
//         message:
//             "Server is temporarily unavailable, please try again later: $e",
//         response: [],
//       );
//     }
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:epolisplus/log/logger.dart';
// import 'package:epolisplus/models/models_export.dart';
// import 'package:epolisplus/repository/partners/partners_repository_iml.dart';
// import 'package:epolisplus/services/api_constanta.dart';
// import 'package:epolisplus/services/api_service.dart';

class PartnersRepository extends PartnersRepositoryIml {
  late ApiService service;

  PartnersRepository() {
    service = ApiService(ApiConstanta.BASE_URL_EPOLIS_PLUS);
  }

  @override
  Future<BaseModels<List<PartnersResponse>>> getPartners(
      int id, String site, String phone, String image) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept-Language': "ru-RU",
      'Accept-Encoding': 'UTF-8',
    };

    var data = {
      "phone": phone,
    };

    var url = ApiConstanta.GET_PARTNERS;

    Response? response;
    print('Calling API...');  // Debugging print

    try {
      // Request to fetch partner data
      response = await service.getPostData(data, headers, url);
      print('API response received.');  // Debugging print

      if (response?.statusCode != 200) {
        print('Error: ${response?.statusCode}');  // Debugging print
        return BaseModels<List<PartnersResponse>>(
          status: response!.statusCode,
          message: response.statusMessage ?? 'An error occurred',
          code: false,
          response: [],
        );
      } else {
        if (response?.data["status"] == 200) {
          var responseData = response?.data['response'];
          List<PartnersResponse> partners = (responseData as List)
              .map((partner) => PartnersResponse.fromJson(partner))
              .toList();
          logger(partners.toString(), error: "Partners Repository");
          print('Partners data fetched: $partners');  // Debugging print

          return BaseModels<List<PartnersResponse>>(
            status: 200,
            message: 'Partners list fetched successfully',
            code: true,
            response: partners,
          );
        } else {
          print('API Error: ${response?.data["message"]}');  // Debugging print
          return BaseModels<List<PartnersResponse>>(
            status: response?.data["status"],
            message: response?.data["message"] ?? 'Unknown error',
            code: false,
            response: [],
          );
        }
      }
    } on Exception catch (e) {
      print('Exception occurred: $e');  // Debugging print
      return BaseModels<List<PartnersResponse>>(
        status: 123,
        code: false,
        message:
            "Server is temporarily unavailable, please try again later: $e",
        response: [],
      );
    }
  }
}
