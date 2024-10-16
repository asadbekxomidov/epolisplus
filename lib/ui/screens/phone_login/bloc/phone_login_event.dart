part of 'phone_login_bloc.dart';

abstract class PhoneLoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthEvent extends PhoneLoginEvent {}

class TogglePhoneWidgetActiveEvent extends PhoneLoginEvent {
  final bool isActive;

  TogglePhoneWidgetActiveEvent(this.isActive);

  @override
  List<Object?> get props => [isActive];
}
