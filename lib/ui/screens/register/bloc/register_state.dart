part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

// ignore: must_be_immutable
class RegisterErrorState extends RegisterState {
  Failure failure;

  RegisterErrorState(this.failure);
}
