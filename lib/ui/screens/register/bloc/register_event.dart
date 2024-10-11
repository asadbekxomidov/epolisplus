part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckRegisterEvent extends RegisterEvent {}

class ToggleAgreeEvent extends RegisterEvent {
  final bool isAgreeChecked;

  ToggleAgreeEvent(this.isAgreeChecked);

  @override
  List<Object?> get props => [isAgreeChecked];
}

class RegisterSetPhoneNumberEvent extends RegisterEvent {
  String number;

  RegisterSetPhoneNumberEvent(this.number);

  @override
  List<Object?> get props => [number];
}
