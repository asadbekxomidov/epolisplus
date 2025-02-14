import 'package:epolisplus/models/servises_responses/responses/casko/casko_list_product.dart';

class CaskoTypeProduct {
  int? price;
  List<CaskoListProduct> list;

  CaskoTypeProduct({
    this.price = 0,
    required this.list,
  });

  factory CaskoTypeProduct.fromJson(Map<String, dynamic> json) {
    return CaskoTypeProduct(
      price: json['price'],
      list: CaskoListProduct.fromListJson(json['list']),
    );
  }

  static fromListJson(List<dynamic> json) {
    var list = <CaskoTypeProduct>[];
    json.map((elem) {
      list.add(CaskoTypeProduct.fromJson(elem));
    }).toList();

    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['list'] = this.list.map((v) => v.toJson()).toList();
    return data;
  }
}
