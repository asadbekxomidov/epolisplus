part of 'phone_password_bloc.dart';

abstract class PhonePasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckPhonePasswordEvent extends PhonePasswordEvent {}

// class PhoneNumberChangedEvent extends PhonePasswordEvent {}

class PhonePasswordSuccsesEvent extends PhonePasswordEvent {
  final String phoneNumber;

  PhonePasswordSuccsesEvent(this.phoneNumber);
}
