import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';

abstract class LocalizedMessage {
  String getErrorMessage(BuildContext context);
}

abstract class Failure implements LocalizedMessage {
  Failure();
}

class GetPartnersErrorclass extends Failure {
  GetPartnersErrorclass() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.partnersGetErrorText;
}

class PartnersPushWebErrorclass extends Failure {
  PartnersPushWebErrorclass() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.partnersPushWeberrortext;
}

class InputPhoneFailure extends Failure {
  InputPhoneFailure() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.input_phone_errors;
}

class InputRegisterFailure extends Failure {
  InputRegisterFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_register_errors;
}

class ButtonRegisterFailure extends Failure {
  ButtonRegisterFailure() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.button_agree;
}

class InputPhoneCodeFailure extends Failure {
  InputPhoneCodeFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_phoneCode_errors;
}

class PhoneCodeFailure extends Failure {
  PhoneCodeFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.phone_password_errors;
}

class SmsSendFailure extends Failure {
  SmsSendFailure() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.error_sms_code;
}

class PaaswordPhoneCodeFailure extends Failure {
  PaaswordPhoneCodeFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_phoneCode_password_errors;
}

class ServerFailure extends Failure {
  String message;

  ServerFailure({required this.message}) : super();

  @override
  String getErrorMessage(BuildContext context) => message;
}

class InformationheadError extends Failure {
  InformationheadError() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.informationnotfound;
}

class CheckInformationtryagain extends Failure {
  CheckInformationtryagain() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.checkinformationtryagain;
}

class InformationnotfoundError extends Failure {
  InformationnotfoundError() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.informationnotfound;
}

class LoginFailure extends Failure {
  LoginFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_password_and_phone_errors;
}

class CarNotFound extends Failure {
  CarNotFound() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.carnotfound;
}

class UserInfoNotChange extends Failure {
  UserInfoNotChange() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.userInfonotchange;
}

class UserInfoNotFound extends Failure {
  UserInfoNotFound() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.userinfonotfound;
}

class OfertaInfoNotFound extends Failure {
  OfertaInfoNotFound() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.ofertainfoNotFound;
}

class QuestionInfonotfound extends Failure {
  QuestionInfonotfound() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.questionInfonotfound;
}

class ErrorSettingssection extends Failure {
  ErrorSettingssection() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.errorSettingssection;
}

class ErrorretrievingtheWarrantycode extends Failure {
  ErrorretrievingtheWarrantycode() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.errorretrievingthewarrantycode;
}

class QrCodeNotFound extends Failure {
  QrCodeNotFound() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.errorQrcodepleasetryagain;
}

class QrCodemaybeerror extends Failure {
  QrCodemaybeerror() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.qrCodemaybeerror;
}
