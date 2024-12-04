import 'package:epolisplus/models/models_export.dart';

class ProfilResponse {
  final String phone;
  final String fullName;
  final List<CarInfoResponse> carInfo;

  ProfilResponse({
    required this.phone,
    required this.fullName,
    required this.carInfo,
  });

  factory ProfilResponse.fromJson(Map<String, dynamic> json) {
    var responseData = json['response'] ?? {};

    return ProfilResponse(
      phone: responseData['PHONE'] ?? '',
      fullName: responseData['FULL_NAME'] ?? '',
      carInfo: (responseData['CAR_INFO'] as List<dynamic>? ?? [])
          .map((item) => CarInfoResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PHONE': phone,
      'FULL_NAME': fullName,
      'CAR_INFO': carInfo.map((item) => item.toJson()).toList(),
    };
  }
}
