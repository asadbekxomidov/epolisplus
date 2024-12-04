class CarInfoResponse {
  final String? error;
  final String? errorMessage;
  final String? techSeriya;
  final String? techPassportIssueDate;
  final String? markaId;
  final String? modelId;
  final String? vehicleTypeId;
  final String? modelName;
  final String? issueYear;

  CarInfoResponse({
    this.error,
    this.errorMessage,
    this.techSeriya,
    this.techPassportIssueDate,
    this.markaId,
    this.modelId,
    this.vehicleTypeId,
    this.modelName,
    this.issueYear,
  });

  // fromJson method
  factory CarInfoResponse.fromJson(Map<String, dynamic> json) {
    return CarInfoResponse(
      error: json['ERROR'],
      errorMessage: json['ERROR_MESSAGE'],
      techSeriya: json['TECH_SERIYA'],
      techPassportIssueDate: json['TECH_PASSPORT_ISSUE_DATE'],
      markaId: json['MARKA_ID'],
      modelId: json['MODEL_ID'],
      vehicleTypeId: json['VEHICLE_TYPE_ID'],
      modelName: json['MODEL_NAME'],
      issueYear: json['TSSUE_YEAR'], // Adjusted based on typo in example
    );
  }

  // toJson method
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
      'TSSUE_YEAR': issueYear,
    };
  }
}
