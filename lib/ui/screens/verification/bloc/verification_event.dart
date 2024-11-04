part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckVerificationEvent extends VerificationEvent {}

class SendVerificationEvent extends VerificationEvent {}

class PhoneNumberChangedEvent extends VerificationEvent {}

class VerificationSigninEvent extends VerificationEvent {
  final String phoneNumber;

  VerificationSigninEvent(this.phoneNumber);
}
