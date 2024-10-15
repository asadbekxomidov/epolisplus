part of 'phone_login_bloc.dart';

abstract class PhoneLoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthEvent extends PhoneLoginEvent {}

class TogglePhoneWidgetActiveEvent extends PhoneLoginEvent {}
