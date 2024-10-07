part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckResetPasswordEvent extends ResetPasswordEvent {}

// class PhoneNumberChangedEvent extends ResetPasswordEvent {}

class ResetPasswordSuccsesEvent extends ResetPasswordEvent {
  final String phoneNumber;

  ResetPasswordSuccsesEvent(this.phoneNumber);
}
