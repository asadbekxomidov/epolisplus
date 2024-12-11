import 'package:epolisplus/models/partners/partners_model/response/product_list.dart';

class PartnersResponse {
  int id;
  String site;
  String phone;
  String image;
  final List<Product> productList;

  PartnersResponse({
    required this.id,
    required this.site,
    required this.phone,
    required this.image,
    required this.productList,
  });

  factory PartnersResponse.fromJson(Map<String, dynamic> json) {
    return PartnersResponse(
      id: json['id'],
      site: json['site'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      productList: (json['product_list'] as List<dynamic>?)
              ?.map((product) =>
                  Product.fromJson(product as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
