// class CarInformationResponse {
//   final String error;
//   final String? errorMessage;
//   final String techPassportIssueDate;
//   final String markaId;
//   final String modelId;
//   final String vehicleTypeId;
//   final String modelName;
//   final String issueYear;
//   final String bodyNumber;
//   final String engineNumber;
//   final String useTerritory;
//   final String fy;
//   final String orgName;
//   final String lastName;
//   final String firstName;
//   final String middleName;
//   final String inn;
//   final String seats;
//   final String pinfl;
//   final String vehilceName;
//   final String vehilceTerritory;
//   final String regionName;
//   final String passportSeries;
//   final String passportNumber;
//   final String passportIssuedBy;
//   final String passportIssuedDate;
//   final String birthday;
//   final String address;

//   CarInformationResponse({
//     required this.error,
//     this.errorMessage,
//     required this.techPassportIssueDate,
//     required this.markaId,
//     required this.modelId,
//     required this.vehicleTypeId,
//     required this.modelName,
//     required this.issueYear,
//     required this.bodyNumber,
//     required this.engineNumber,
//     required this.useTerritory,
//     required this.fy,
//     required this.orgName,
//     required this.lastName,
//     required this.firstName,
//     required this.middleName,
//     required this.inn,
//     required this.seats,
//     required this.pinfl,
//     required this.vehilceName,
//     required this.vehilceTerritory,
//     required this.passportSeries,
//     required this.passportNumber,
//     required this.passportIssuedBy,
//     required this.passportIssuedDate,
//     required this.birthday,
//     required this.regionName,
//     required this.address,
//   });

//   // From JSON
//   factory CarInformationResponse.fromJson(Map<String, dynamic> json) {
//     return CarInformationResponse(
//       error: json["ERROR"],
//       errorMessage: json["ERROR_MESSAGE"],
//       techPassportIssueDate: json["TECH_PASSPORT_ISSUE_DATE"],
//       markaId: json["MARKA_ID"],
//       modelId: json["MODEL_ID"],
//       vehicleTypeId: json["VEHICLE_TYPE_ID"],
//       modelName: json["MODEL_NAME"],
//       issueYear: json["ISSUE_YEAR"],
//       bodyNumber: json["BODY_NUMBER"],
//       engineNumber: json["ENGINE_NUMBER"],
//       useTerritory: json["USE_TERRITORY"],
//       fy: json["FY"],
//       orgName: json["ORGNAME"],
//       lastName: json["LAST_NAME"],
//       firstName: json["FIRST_NAME"],
//       middleName: json["MIDDLE_NAME"],
//       inn: json["INN"] ?? "", // Default to empty string if null
//       seats: json["SEATS"],
//       pinfl: json["PINFL"],
//       vehilceName: json["VEHICLE_TYPE_NAME"],
//       vehilceTerritory: json["VEHICLE_TERRITORY_ID"],
//       regionName: json["REGION_NAME"],
//       passportSeries: json["PASSPORT_SERIES"] ?? "",
//       passportNumber: json["PASSPORT_NUMBER"] ?? "",
//       passportIssuedBy: json["PASSPORT_ISSUED_BY"] ?? "",
//       passportIssuedDate: json["PASSPORT_ISSUE_DATE"] ?? "",
//       birthday: json["BIRTHDAY"],
//       address: json["ADDRESS"] ?? "",
//     );
//   }

//   // To JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "ERROR": error,
//       "ERROR_MESSAGE": errorMessage,
//       "TECH_PASSPORT_ISSUE_DATE": techPassportIssueDate,
//       "MARKA_ID": markaId,
//       "MODEL_ID": modelId,
//       "VEHICLE_TYPE_ID": vehicleTypeId,
//       "MODEL_NAME": modelName,
//       "ISSUE_YEAR": issueYear,
//       "BODY_NUMBER": bodyNumber,
//       "ENGINE_NUMBER": engineNumber,
//       "USE_TERRITORY": useTerritory,
//       "FY": fy,
//       "ORGNAME": orgName,
//       "LAST_NAME": lastName,
//       "FIRST_NAME": firstName,
//       "MIDDLE_NAME": middleName,
//       "INN": inn,
//       "SEATS": seats,
//       "PINFL": pinfl,
//       "VEHICLE_TYPE_NAME": vehilceName,
//       "VEHICLE_TERRITORY_ID": vehilceTerritory,
//       "REGION_NAME": regionName,
//       "PASSPORT_SERIES": passportSeries,
//       "PASSPORT_NUMBER": passportNumber,
//       "PASSPORT_ISSUED_BY": passportIssuedBy,
//       "PASSPORT_ISSUE_DATE": passportIssuedDate,
//       "BIRTHDAY": birthday,
//       "ADDRESS": address,
//     };
//   }
// }

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
  final String vehicleName; // Fix here
  final String vehicleTerritory; // Fix here
  final String regionName;
  final String passportSeries;
  final String passportNumber;
  final String passportIssuedBy;
  final String passportIssuedDate;
  final String birthday;
  final String address;

  CarInformationResponse({
     this.error="",
    this.errorMessage="",
     this.techPassportIssueDate="",
     this.markaId="",
     this.modelId="",
     this.vehicleTypeId="",
     this.modelName="",
     this.issueYear="",
     this.bodyNumber="",
     this.engineNumber="",
     this.useTerritory="",
     this.fy="",
     this.orgName="",
     this.lastName="",
     this.firstName="",
     this.middleName="",
     this.inn="",
     this.seats="",
     this.pinfl="",
     this.vehicleName="",
     this.vehicleTerritory="",
     this.passportSeries="",
     this.passportNumber="",
     this.passportIssuedBy="",
     this.passportIssuedDate="",
     this.birthday="",
     this.regionName="",
     this.address="",
  });

  // From JSON
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
      vehicleName: json["VEHICLE_TYPE_NAME"], // Correct key mapping
      vehicleTerritory: json["VEHICLE_TERRITORY_ID"], // Correct key mapping
      regionName: json["REGION_NAME"],
      passportSeries: json["PASSPORT_SERIES"] ?? "",
      passportNumber: json["PASSPORT_NUMBER"] ?? "",
      passportIssuedBy: json["PASSPORT_ISSUED_BY"] ?? "",
      passportIssuedDate: json["PASSPORT_ISSUE_DATE"] ?? "",
      birthday: json["BIRTHDAY"],
      address: json["ADDRESS"] ?? "",
    );
  }

  // To JSON
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
      "VEHICLE_TYPE_NAME": vehicleName, // Correct key mapping
      "VEHICLE_TERRITORY_ID": vehicleTerritory, // Correct key mapping
      "REGION_NAME": regionName,
      "PASSPORT_SERIES": passportSeries,
      "PASSPORT_NUMBER": passportNumber,
      "PASSPORT_ISSUED_BY": passportIssuedBy,
      "PASSPORT_ISSUE_DATE": passportIssuedDate,
      "BIRTHDAY": birthday,
      "ADDRESS": address,
    };
  }

  // @override
  // String toString() {
  //   return "CarInformationResponse(error: '$error', errorMessage: '${errorMessage}', techPassportIssueDate: '$techPassportIssueDate', markaId: '$markaId', modelId: '$modelId', vehicleTypeId: '$vehicleTypeId', modelName: '$modelName', issueYear: '$issueYear', bodyNumber: '$bodyNumber', engineNumber: '$engineNumber', useTerritory: '$useTerritory', fy: '$fy', orgName: '$orgName', lastName: '$lastName', firstName: '$firstName', middleName: '$middleName', inn: '$inn', seats: '$seats', pinfl: '$pinfl', vehilceName: '$vehicleName', vehilceTerritory: '$vehicleTerritory', regionName: '$regionName', passportSeries: '$passportSeries', passportNumber: '$passportNumber', passportIssuedBy: '$passportIssuedBy', passportIssuedDate: '$passportIssuedDate', birthday: '$birthday', address: '$address')";
  // }

  @override
  String toString() {
    return "CarInformationResponse{error: '$error', errorMessage: '${errorMessage}', techPassportIssueDate: '$techPassportIssueDate', markaId: '$markaId', modelId: '$modelId', vehicleTypeId: '$vehicleTypeId', modelName: '$modelName', issueYear: '$issueYear', bodyNumber: '$bodyNumber', engineNumber: '$engineNumber', useTerritory: '$useTerritory', fy: '$fy', orgName: '$orgName', lastName: '$lastName', firstName: '$firstName', middleName: '$middleName', inn: '$inn', seats: '$seats', pinfl: '$pinfl', vehilceName: '$vehicleName', vehilceTerritory: '$vehicleTerritory', regionName: '$regionName', passportSeries: '$passportSeries', passportNumber: '$passportNumber', passportIssuedBy: '$passportIssuedBy', passportIssuedDate: '$passportIssuedDate', birthday: '$birthday', address: '$address'}";
  }
}
