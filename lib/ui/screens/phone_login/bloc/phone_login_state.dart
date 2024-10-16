part of 'phone_login_bloc.dart';

abstract class PhoneLoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SuccessState extends PhoneLoginState {}

class PhoneWidgetState extends PhoneLoginState {
  final bool isActive;

  PhoneWidgetState({this.isActive = true});

  @override
  List<Object?> get props => [isActive];
}

class LoadingState extends PhoneLoginState {}

class ErrorState extends PhoneLoginState {
  Failure failure;

  ErrorState(this.failure);
}
