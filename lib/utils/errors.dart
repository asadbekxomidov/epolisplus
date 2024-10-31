import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';

abstract class LocalizedMessage {
  String getErrorMessage(BuildContext context);
}

abstract class Failure implements LocalizedMessage {
  Failure();
}

class InputPhoneFailure extends Failure {
  InputPhoneFailure() : super();

  @override
  String getErrorMessage(BuildContext context) => AppStrings.input_phone_errors;
}

class LoginFailure extends Failure {
  LoginFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_password_and_phone_errors;
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
