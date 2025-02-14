class CompanyModel {
  int? company_id;
  String? company_name;
  String? company_image;

  CompanyModel({
    this.company_id = 0,
    this.company_name = "",
    this.company_image = "",
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      company_id: json['company_id'],
      company_name: json['company_name'],
      company_image: json['company_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = company_id;
    data['company_name'] = company_name;
    data['company_image'] = company_image;
    return data;
  }
}
