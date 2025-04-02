class LitroRiskLst {
  int? id;
  String? name;
  String? icon;
  String? info;
  int? price;
  bool? isSelect;

  LitroRiskLst({
    this.id = 0,
    this.name = "",
    this.icon = "",
    this.info = "",
    this.price = 0,
    this.isSelect = false,
  });

  factory LitroRiskLst.fromJson(Map<String, dynamic> json) {
    return LitroRiskLst(
      id: json['id'],
      name: json['name'],
      icon: json['icon'] ?? "",
      info: json['info'],
      price: json['price'],
      isSelect: json['isSelect'] ?? false,
    );
  }

  static fromListJson(List<dynamic> json) {
    var list = <LitroRiskLst>[];
    json.map((elem) {
      list.add(LitroRiskLst.fromJson(elem));
    }).toList();

    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['info'] = info;
    data['price'] = price;
    data['isSelect'] = isSelect;
    return data;
  }

  LitroRiskLst copyWith({bool? isSelect}) {
    return LitroRiskLst(
      isSelect: isSelect ?? this.isSelect,
    );
  }
}
