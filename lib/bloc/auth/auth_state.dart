part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneNumberValidatedState extends AuthState {
  final String phoneNumber;

  PhoneNumberValidatedState(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class AuthSuccessState extends AuthState {
  final String message;

  AuthSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class AuthLoadingState extends AuthState {}

class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
