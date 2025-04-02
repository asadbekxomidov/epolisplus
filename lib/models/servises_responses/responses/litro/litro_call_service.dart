import 'package:epolisplus/models/servises_responses/responses/litro/litro_risk_lst.dart';

class LitroCallService {
  String name;
  String info;
  String phone;
  List<LitroRiskLst> risk;

  LitroCallService({
    this.name = "",
    this.info = "",
    this.phone = "",
    required this.risk,
  });

  factory LitroCallService.fromJson(Map<String, dynamic> json) {
    return LitroCallService(
      name: json['name'],
      info: json['info'],
      phone: json['phone'],
      risk: LitroRiskLst.fromListJson(json['risk']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['info'] = info;
    data['phone'] = phone;
    data['risk'] = this.risk.map((v) => v.toJson()).toList();
    return data;
  }
}
