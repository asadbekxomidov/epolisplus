part of 'phone_login_bloc.dart';

abstract class PhoneLoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SuccessState extends PhoneLoginState {}

class LoadingState extends PhoneLoginState {}

// ignore: must_be_immutable
class ErrorState extends PhoneLoginState {
  Failure failure;

  ErrorState(this.failure);
}
