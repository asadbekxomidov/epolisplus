part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckLoginEvent extends LoginEvent {}

class SetPhoneNumberEvent extends LoginEvent {
  String number;

  SetPhoneNumberEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class LoginResetPasswordEvent extends LoginEvent {}
