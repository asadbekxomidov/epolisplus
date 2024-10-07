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
      AppStrings.input_password_errors;
}

class InputRegisterFailure extends Failure {
  InputRegisterFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_register_errors;
}

class InputPhoneCodeFailure extends Failure {
  InputPhoneCodeFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_phoneCode_errors;
}

class PaaswordPhoneCodeFailure extends Failure {
  PaaswordPhoneCodeFailure() : super();

  @override
  String getErrorMessage(BuildContext context) =>
      AppStrings.input_phoneCode_password_errors;
}
