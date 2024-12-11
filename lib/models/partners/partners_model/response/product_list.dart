class Product {
  final String icon;
  final String name;

  Product({required this.icon, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      icon: json['icon'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
