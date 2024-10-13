part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SuccessState extends LoginState {}
class LoginLoadingtate extends LoginState {}

class LoginErrorState extends LoginState {
  Failure failure;

  LoginErrorState(this.failure);
}

class PhoneInputChangedState extends LoginState {
  final bool isActive;

  PhoneInputChangedState(this.isActive);

  @override
  List<Object?> get props => [isActive];
}
