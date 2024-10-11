part of 'password_widget_bloc.dart';

abstract class PasswordState {}

class PasswordVisible extends PasswordState {
  final bool isObscure;

  PasswordVisible(this.isObscure);
}
