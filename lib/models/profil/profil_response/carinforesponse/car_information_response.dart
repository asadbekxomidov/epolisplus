class CarInformationResponse {
  final String error;
  final String? errorMessage;
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
  final String seats;
  final String pinfl;
  final String vehicleName;
  final String vehicleTerritory;
  final String regionName;
  final String passportSeries;
  final String passportNumber;
  final String passportIssuedBy;
  final String passportIssuedDate;
  final String birthday;
  final String address;
  String govNum;
  String techSeria;
  String techNumber;

  CarInformationResponse({
    this.error = "",
    this.errorMessage = "",
    this.techPassportIssueDate = "",
    this.markaId = "",
    this.modelId = "",
    this.vehicleTypeId = "",
    this.modelName = "",
    this.issueYear = "",
    this.bodyNumber = "",
    this.engineNumber = "",
    this.useTerritory = "",
    this.fy = "",
    this.orgName = "",
    this.lastName = "",
    this.firstName = "",
    this.middleName = "",
    this.inn = "",
    this.seats = "",
    this.pinfl = "",
    this.vehicleName = "",
    this.vehicleTerritory = "",
    this.passportSeries = "",
    this.passportNumber = "",
    this.passportIssuedBy = "",
    this.passportIssuedDate = "",
    this.birthday = "",
    this.regionName = "",
    this.address = "",
    this.govNum = "",
    this.techSeria = "",
    this.techNumber = "",
  });

  factory CarInformationResponse.fromJson(Map<String, dynamic> json) {
    return CarInformationResponse(
      error: json["ERROR"],
      errorMessage: json["ERROR_MESSAGE"],
      techPassportIssueDate: json["TECH_PASSPORT_ISSUE_DATE"],
      markaId: json["MARKA_ID"],
      modelId: json["MODEL_ID"],
      vehicleTypeId: json["VEHICLE_TYPE_ID"],
      modelName: json["MODEL_NAME"],
      issueYear: json["ISSUE_YEAR"],
      bodyNumber: json["BODY_NUMBER"],
      engineNumber: json["ENGINE_NUMBER"],
      useTerritory: json["USE_TERRITORY"],
      fy: json["FY"],
      orgName: json["ORGNAME"],
      lastName: json["LAST_NAME"],
      firstName: json["FIRST_NAME"],
      middleName: json["MIDDLE_NAME"],
      inn: json["INN"] ?? "",
      seats: json["SEATS"],
      pinfl: json["PINFL"],
      vehicleName: json["VEHICLE_TYPE_NAME"],
      vehicleTerritory: json["VEHICLE_TERRITORY_ID"],
      regionName: json["REGION_NAME"],
      passportSeries: json["PASSPORT_SERIES"] ?? "",
      passportNumber: json["PASSPORT_NUMBER"] ?? "",
      passportIssuedBy: json["PASSPORT_ISSUED_BY"] ?? "",
      passportIssuedDate: json["PASSPORT_ISSUE_DATE"] ?? "",
      birthday: json["BIRTHDAY"],
      address: json["ADDRESS"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ERROR": error,
      "ERROR_MESSAGE": errorMessage,
      "TECH_PASSPORT_ISSUE_DATE": techPassportIssueDate,
      "MARKA_ID": markaId,
      "MODEL_ID": modelId,
      "VEHICLE_TYPE_ID": vehicleTypeId,
      "MODEL_NAME": modelName,
      "ISSUE_YEAR": issueYear,
      "BODY_NUMBER": bodyNumber,
      "ENGINE_NUMBER": engineNumber,
      "USE_TERRITORY": useTerritory,
      "FY": fy,
      "ORGNAME": orgName,
      "LAST_NAME": lastName,
      "FIRST_NAME": firstName,
      "MIDDLE_NAME": middleName,
      "INN": inn,
      "SEATS": seats,
      "PINFL": pinfl,
      "VEHICLE_TYPE_NAME": vehicleName,
      "VEHICLE_TERRITORY_ID": vehicleTerritory,
      "REGION_NAME": regionName,
      "PASSPORT_SERIES": passportSeries,
      "PASSPORT_NUMBER": passportNumber,
      "PASSPORT_ISSUED_BY": passportIssuedBy,
      "PASSPORT_ISSUE_DATE": passportIssuedDate,
      "BIRTHDAY": birthday,
      "ADDRESS": address,
      "GOV_NUMBER": govNum,
      "TECH_SERIYA": techSeria,
      "TECH_NUMBER": techNumber,
    };
  }
}
