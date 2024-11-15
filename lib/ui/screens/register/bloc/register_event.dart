part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckRegisterEvent extends RegisterEvent {}

class ToggleAgreeEvent extends RegisterEvent {}

class RegisterSetPhoneNumberEvent extends RegisterEvent {
  String number;

  RegisterSetPhoneNumberEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class OfertaPushEvent extends RegisterEvent {}
