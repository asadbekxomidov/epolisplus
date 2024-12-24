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
  final String fy;
  final String orgName;
  final String lastName;
  final String firstName;
  final String middleName;
  final String inn;
  final String pinfl;
  final String techNumber;
  final String govNumber;
  final bool errorFlag;

  CarInfoResponse({
    required this.error,
    this.errorMessage,
    required this.techSeriya,
    required this.techPassportIssueDate,
    required this.markaId,
    required this.modelId,
    required this.vehicleTypeId,
    required this.modelName,
    required this.issueYear,
    required this.bodyNumber,
    required this.engineNumber,
    required this.useTerritory,
    required this.fy,
    required this.orgName,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.inn,
    required this.pinfl,
    required this.techNumber,
    required this.govNumber,
    required this.errorFlag,
  });

  // From JSON
  factory CarInfoResponse.fromJson(Map<String, dynamic> json) {
    return CarInfoResponse(
      error: json['ERROR'] as String,
      errorMessage: json['ERROR_MESSAGE'] as String?,
      techSeriya: json['TECH_SERIYA'] as String,
      techPassportIssueDate: json['TECH_PASSPORT_ISSUE_DATE'] as String,
      markaId: json['MARKA_ID'] as String,
      modelId: json['MODEL_ID'] as String,
      vehicleTypeId: json['VEHICLE_TYPE_ID'] as String,
      modelName: json['MODEL_NAME'] as String,
      issueYear: json['ISSUE_YEAR'] as String,
      bodyNumber: json['BODY_NUMBER'] as String,
      engineNumber: json['ENGINE_NUMBER'] as String,
      useTerritory: json['USE_TERRITORY'] as String,
      fy: json['FY'] as String,
      orgName: json['ORGNAME'] as String,
      lastName: json['LAST_NAME'] as String,
      firstName: json['FIRST_NAME'] as String,
      middleName: json['MIDDLE_NAME'] as String,
      inn: json['INN'] as String,
      pinfl: json['PINFL'] as String,
      techNumber: json['TECH_NUMBER'] as String,
      govNumber: json['GOV_NUMBER'] as String,
      errorFlag: json['error'] as bool,
    );
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
