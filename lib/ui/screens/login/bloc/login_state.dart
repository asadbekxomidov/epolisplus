part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SuccessState extends LoginState {}

// class AuthLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  Failure failure;

  LoginErrorState(this.failure);
}
