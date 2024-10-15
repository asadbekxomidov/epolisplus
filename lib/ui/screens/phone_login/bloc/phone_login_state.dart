part of 'phone_login_bloc.dart';

abstract class PhoneLoginState extends Equatable {
  final bool isActive;

  const PhoneLoginState({this.isActive = true});

  @override
  List<Object?> get props => [isActive];
  // @override
  // List<Object?> get props => [];
}

class SuccessState extends PhoneLoginState {}

class LoadingState extends PhoneLoginState {}

// ignore: must_be_immutable
class ErrorState extends PhoneLoginState {
  Failure failure;

  ErrorState(this.failure);
}

class PhoneSuccessState extends PhoneLoginState {
  PhoneSuccessState({bool isActive = true}) : super(isActive: isActive);
}
