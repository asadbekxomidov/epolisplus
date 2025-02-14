import 'package:epolisplus/models/servises_responses/responses/casko/casko_type_list.dart';

class CaskoResponse {
  int? id;
  String? name;
  String? icon;
  bool? is_access;
  String? info;
  int? bonus_price;
  int? total_price;
  List<CaskoTypeProduct> type;

  CaskoResponse({
    this.id = 0,
    this.name = "",
    this.icon = "",
    this.is_access = false,
    this.info = "",
    this.bonus_price = 0,
    this.total_price = 0,
    required this.type,
  });

  factory CaskoResponse.fromJson(Map<String, dynamic> json) {
    return CaskoResponse(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      is_access: json['is_access'],
      info: json['info'],
      bonus_price: json['bonus_price'],
      total_price: json['total_price'],
      type: CaskoTypeProduct.fromListJson(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['is_access'] = is_access;
    data['info'] = info;
    data['bonus_price'] = bonus_price;
    data['total_price'] = total_price;
    data['type'] = this.type.map((v) => v.toJson()).toList();
    return data;
  }
}
