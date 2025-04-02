import 'package:epolisplus/models/servises_responses/responses/litro/litro_risk_lst.dart';

class LitroResponse {
  String name;
  String info;
  String? discount_title;
  String? discount_body;
  bool? active_service;
  int discount_length;
  int discount_percent;
  List<LitroRiskLst> risk;

  LitroResponse({
    this.name = "",
    this.info = "",
    this.discount_title = "",
    this.discount_body = "",
    this.discount_length = 0,
    this.discount_percent = 0,
    this.active_service = true,
    required this.risk,
  });

  factory LitroResponse.fromJson(Map<String, dynamic> json) {
    return LitroResponse(
      name: json['name'],
      info: json['info'],
      discount_title: json['discount_title'],
      discount_body: json['discount_body'],
      discount_length: json['discount_length'],
      discount_percent: json['discount_percent'],
      active_service: true,
      risk: LitroRiskLst.fromListJson(json['risk']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['info'] = info;
    data['discount_title'] = discount_title;
    data['discount_body'] = discount_body;
    data['discount_length'] = discount_length;
    data['discount_percent'] = discount_percent;
    data['active_service'] = active_service;
    data['risk'] = this.risk.map((v) => v.toJson()).toList();
    return data;
  }
}
