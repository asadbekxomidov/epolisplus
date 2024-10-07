part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPasswordSuccessState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  Failure failure;

  ResetPasswordErrorState(this.failure);
}
