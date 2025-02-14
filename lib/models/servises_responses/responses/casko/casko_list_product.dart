class CaskoListProduct {
  String? name;
  String? info;
  String? description;
  String? icon_svg;

  CaskoListProduct({
    this.name = '',
    this.info = '',
    this.description = '',
    this.icon_svg = '',
  });

  factory CaskoListProduct.fromJson(Map<String, dynamic> json) {
    return CaskoListProduct(
      name: json['name'],
      info: json['info'],
      description: json['description'],
      icon_svg: json['icon_svg'],
    );
  }

  static fromListJson(List<dynamic> json) {
    var list = <CaskoListProduct>[];
    json.map((elem) {
      list.add(CaskoListProduct.fromJson(elem));
    }).toList();

    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['info'] = info;
    data['description'] = description;
    data['icon_svg'] = icon_svg;
    return data;
  }
}
