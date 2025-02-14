class DriverSummaryResponse {
  String? BIRTH_DATE;
  String? ERROR;
  String? FIRST_NAME_LATIN;
  String? ISPENSIONER;
  String? ISSUE_DATE;
  String? LAST_NAME_LATIN;
  String? LICENSE_NUMBER;
  String? LICENSE_SERIA;
  String? MIDDLE_NAME_LATIN;
  String? OBLAST;
  String? RAYON;
  String? PINFL;
  String? PASSPORT_SERIA;
  String? PASSPORT_NUMBER;
  String? ADDRESS;

  DriverSummaryResponse({
    this.BIRTH_DATE = "",
    this.ERROR = "",
    this.FIRST_NAME_LATIN = "",
    this.ISPENSIONER = "",
    this.ISSUE_DATE = "",
    this.LAST_NAME_LATIN = "",
    this.LICENSE_NUMBER = "",
    this.LICENSE_SERIA = "",
    this.MIDDLE_NAME_LATIN = "",
    this.OBLAST = "",
    this.RAYON = "",
    this.PINFL = "",
    this.PASSPORT_SERIA = "",
    this.PASSPORT_NUMBER = "",
    this.ADDRESS = "",
  });

  factory DriverSummaryResponse.fromJson(Map<String, dynamic> json) {
    return DriverSummaryResponse(
      BIRTH_DATE: json['BIRTH_DATE'],
      ERROR: json['ERROR'],
      FIRST_NAME_LATIN: json['FIRST_NAME_LATIN'],
      ISPENSIONER: json['ISPENSIONER'],
      ISSUE_DATE: json['ISSUE_DATE'],
      LAST_NAME_LATIN: json['LAST_NAME_LATIN'],
      LICENSE_NUMBER: json['LICENSE_NUMBER'],
      LICENSE_SERIA: json['LICENSE_SERIA'],
      MIDDLE_NAME_LATIN: json['MIDDLE_NAME_LATIN'],
      OBLAST: json['OBLAST'],
      RAYON: json['RAYON'],
      PINFL: json['PINFL'],
      PASSPORT_SERIA: json['PASSPORT_SERIA'],
      PASSPORT_NUMBER: json['PASSPORT_NUMBER'],
      ADDRESS: json['ADDRESS'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BIRTH_DATE'] = this.BIRTH_DATE;
    data['ERROR'] = this.ERROR;
    data['FIRST_NAME_LATIN'] = this.FIRST_NAME_LATIN;
    data['ISPENSIONER'] = this.ISPENSIONER;
    data['ISSUE_DATE'] = this.ISSUE_DATE;
    data['LAST_NAME_LATIN'] = this.LAST_NAME_LATIN;
    data['LICENSE_NUMBER'] = this.LICENSE_NUMBER;
    data['LICENSE_SERIA'] = this.LICENSE_SERIA;
    data['MIDDLE_NAME_LATIN'] = this.MIDDLE_NAME_LATIN;
    data['OBLAST'] = this.OBLAST;
    data['RAYON'] = this.RAYON;
    data['PINFL'] = this.PINFL;
    data['PASSPORT_SERIA'] = this.PASSPORT_SERIA;
    data['PASSPORT_NUMBER'] = this.PASSPORT_NUMBER;
    data['ADDRESS'] = this.ADDRESS;
    return data;
  }
}

class DriverResponseMyPolicy {
  String? full_name;
  String? relation_name;

  DriverResponseMyPolicy({
    this.full_name = "",
    this.relation_name = "",
  });

  factory DriverResponseMyPolicy.fromJson(Map<String, dynamic> json) {
    return DriverResponseMyPolicy(
      full_name: json['full_name'],
      relation_name: json['relation_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.full_name;
    data['relation_name'] = this.relation_name;
    return data;
  }

  static fromListJson(List<dynamic> json) {
    var list = <DriverResponseMyPolicy>[];
    json.map((elem) {
      list.add(DriverResponseMyPolicy.fromJson(elem));
    }).toList();

    return list;
  }
}
