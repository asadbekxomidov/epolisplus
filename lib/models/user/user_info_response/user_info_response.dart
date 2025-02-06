class UserInfoResponse {
  final String error;
  final String errorMessage;
  final String pinfl;
  final String lastName;
  final String firstName;
  final String middleName;
  final String lastNameENG;
  final String firstNameENG;
  final String regionId;
  final String districtId;
  final String address;
  final String fullNameTMR;

  UserInfoResponse({
    this.error = '',
    this.errorMessage = '',
    this.pinfl = '',
    this.lastName = '',
    this.firstName = '',
    this.middleName = '',
    this.lastNameENG = '',
    this.firstNameENG = '',
    this.regionId = '',
    this.districtId = '',
    this.address = '',
    this.fullNameTMR = '',
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      error: json['ERROR'],
      errorMessage: json['ERROR_MESSAGE'],
      pinfl: json['PINFL'],
      lastName: json['LAST_NAME'],
      firstName: json['FIRST_NAME'],
      middleName: json['MIDDLE_NAME'],
      lastNameENG: json['LAST_NAME_ENG'],
      firstNameENG: json['FIRST_NAME_ENG'],
      regionId: json['REGION_ID'],
      districtId: json['DISTRICT_ID'],
      address: json['ADDRESS'],
      fullNameTMR: json['FULL_NAME_TMP'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ERROR': error,
      'ERROR_MESSAGE': errorMessage,
      'PINFL': pinfl,
      'LAST_NAME': lastName,
      'FIRST_NAME': firstName,
      'MIDDLE_NAME': middleName,
      'LAST_NAME_ENG': lastNameENG,
      'FIRST_NAME_ENG': firstNameENG,
      'REGION_ID': firstNameENG,
      'DISTRICT_ID': districtId,
      'ADDRESS': address,
      'FULL_NAME_TMP': fullNameTMR,
    };
  }
}
