part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneNumberChangedEvent extends AuthEvent {
  final String phoneNumber;

  PhoneNumberChangedEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  LoginEvent(this.phoneNumber, this.password);
}

class RegisterEvent extends AuthEvent {
  final String fullName;
  final String phone;
  final String password;

  RegisterEvent(this.fullName, this.phone, this.password);

  @override
  List<Object> get props => [fullName, phone, password];
}

class NavigateToCreateAccountEvent extends AuthEvent {}

class NavigateToLoginEvent extends AuthEvent {}
