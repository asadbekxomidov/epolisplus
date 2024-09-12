part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneNumberValidated extends AuthState {
  final String phoneNumber;

  PhoneNumberValidated(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
