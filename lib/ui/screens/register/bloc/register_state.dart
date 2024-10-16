part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  Failure failure;

  RegisterErrorState(this.failure);
}

class RegisterAgreeCheckedState extends RegisterState {
  final bool isAgreeChecked;

  RegisterAgreeCheckedState(this.isAgreeChecked);

  @override
  List<Object?> get props => [isAgreeChecked];
}
