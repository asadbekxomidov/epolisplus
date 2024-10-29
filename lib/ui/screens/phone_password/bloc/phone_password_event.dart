part of 'phone_password_bloc.dart';

abstract class PhonePasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckPhonePasswordEvent extends PhonePasswordEvent {}

class PhoneNumberEvent extends PhonePasswordEvent {
  String number;

  PhoneNumberEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class PhonePasswordSuccsesEvent extends PhonePasswordEvent {
  final String phoneNumber;

  PhonePasswordSuccsesEvent(this.phoneNumber);
}
