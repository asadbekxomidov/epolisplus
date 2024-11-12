class PartnersResponse {
  int id;
  String site;
  String phone;
  String image;

  PartnersResponse({
    required this.id,
    required this.site,
    required this.phone,
    required this.image,
  });

  factory PartnersResponse.fromJson(Map<String, dynamic> json) {
    return PartnersResponse(
      id: json['id'],
      site: json['site'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
