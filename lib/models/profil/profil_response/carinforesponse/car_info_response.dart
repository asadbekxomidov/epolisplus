class CarInfoResponse {
  final String error;
  final String? errorMessage;
  final String techSeriya;
  final String techPassportIssueDate;
  final String markaId;
  final String modelId;
  final String vehicleTypeId;
  final String modelName;
  final String issueYear;
  final String bodyNumber;
  final String engineNumber;
  final String useTerritory;
  final String? fy;
  final String orgName;
  final String lastName;
  final String firstName;
  final String middleName;
  final String? inn;
  final String pinfl;
  final String techNumber;
  final String govNumber;
  final bool errorFlag;

  CarInfoResponse({
    this.error = '',
    this.errorMessage = '',
    this.techSeriya = '',
    this.techPassportIssueDate = '',
    this.markaId = '',
    this.modelId = '',
    this.vehicleTypeId = '',
    this.modelName = '',
    this.issueYear = '',
    this.bodyNumber = '',
    this.engineNumber = '',
    this.useTerritory = '',
    this.fy = '',
    this.orgName = '',
    this.lastName = '',
    this.firstName = '',
    this.middleName = '',
    this.inn = '',
    this.pinfl = '',
    this.techNumber = '',
    this.govNumber = '',
    this.errorFlag = false,
  });

  // From JSON
  factory CarInfoResponse.fromJson(Map<String, dynamic> json) {
    return CarInfoResponse(
      error: json['ERROR'],
      errorMessage: json['ERROR_MESSAGE'] ?? "",
      techSeriya: json['TECH_SERIYA'],
      techPassportIssueDate: json['TECH_PASSPORT_ISSUE_DATE'],
      markaId: json['MARKA_ID'],
      modelId: json['MODEL_ID'],
      vehicleTypeId: json['VEHICLE_TYPE_ID'],
      modelName: json['MODEL_NAME'],
      issueYear: json['ISSUE_YEAR'],
      bodyNumber: json['BODY_NUMBER'],
      engineNumber: json['ENGINE_NUMBER'],
      useTerritory: json['USE_TERRITORY'],
      fy: json['FY'] ?? "",
      orgName: json['ORGNAME'],
      lastName: json['LAST_NAME'],
      firstName: json['FIRST_NAME'],
      middleName: json['MIDDLE_NAME'],
      inn: json['INN'] ?? "",
      pinfl: json['PINFL'],
      techNumber: json['TECH_NUMBER'],
      govNumber: json['GOV_NUMBER'],
      errorFlag: json['error'],
    );
  }

  static fromListJson(List<dynamic> json) {
    var list = <CarInfoResponse>[];
    json.map((elem) {
      list.add(CarInfoResponse.fromJson(elem));
    }).toList();

    return list;
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'ERROR': error,
      'ERROR_MESSAGE': errorMessage,
      'TECH_SERIYA': techSeriya,
      'TECH_PASSPORT_ISSUE_DATE': techPassportIssueDate,
      'MARKA_ID': markaId,
      'MODEL_ID': modelId,
      'VEHICLE_TYPE_ID': vehicleTypeId,
      'MODEL_NAME': modelName,
      'ISSUE_YEAR': issueYear,
      'BODY_NUMBER': bodyNumber,
      'ENGINE_NUMBER': engineNumber,
      'USE_TERRITORY': useTerritory,
      'FY': fy,
      'ORGNAME': orgName,
      'LAST_NAME': lastName,
      'FIRST_NAME': firstName,
      'MIDDLE_NAME': middleName,
      'INN': inn,
      'PINFL': pinfl,
      'TECH_NUMBER': techNumber,
      'GOV_NUMBER': govNumber,
      'error': errorFlag,
    };
  }
}
