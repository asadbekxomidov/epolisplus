part of 'osago_bloc.dart';

abstract class OsagoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends OsagoState {}

class LoadedState extends OsagoState {}

class ErrorState extends OsagoState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends OsagoState {}
