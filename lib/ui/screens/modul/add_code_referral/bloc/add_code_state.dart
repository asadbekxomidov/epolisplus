part of 'add_code_bloc.dart';

abstract class AddCodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AddCodeState {}

class LoadedState extends AddCodeState {}

class ErrorState extends AddCodeState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends AddCodeState {}
