part of 'phone_password_bloc.dart';

abstract class PhonePasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhonePasswordSuccessState extends PhonePasswordState {}

class PhonePasswordLoadingState extends PhonePasswordState {}

class PhonePasswordErrorState extends PhonePasswordState {
  Failure failure;

  PhonePasswordErrorState(this.failure);
}
