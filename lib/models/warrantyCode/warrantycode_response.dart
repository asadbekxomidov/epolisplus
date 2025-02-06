class WarrantycodeResponse {
  final int id;
  final String name;
  final String icon;
  final String info;
  final String objectType;
  final String title;
  final String hint;
  final bool hasInput;
  final int hasPayment;
  final String paymentPercent;
  final String paymentLabel;

  WarrantycodeResponse({
    this.id = 0,
    this.name = '',
    this.icon = '',
    this.info = '',
    this.objectType = '',
    this.title = '',
    this.hint = '',
    this.hasInput = false,
    this.hasPayment = 0,
    this.paymentLabel = '',
    this.paymentPercent = '',
  });

  factory WarrantycodeResponse.fromJson(Map<String, dynamic> json) {
    return WarrantycodeResponse(
      id: json["id"],
      name: json["name"],
      icon: json["icon"],
      info: json["info"],
      objectType: json["objectType"],
      title: json["title"],
      hint: json["hint"],
      hasInput: json["has_input"],
      hasPayment: json["has_payment"],
      paymentPercent: json["payment_percent"],
      paymentLabel: json["payment_label"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "icon": icon,
      "info": info,
      "objectType": objectType,
      "title": title,
      "hint": hint,
      "has_input": hasInput,
      "has_payment": hasPayment,
      "payment_percent": paymentPercent,
      "payment_label": paymentLabel,
    };
  }
}
