part of 'warrantycode_bloc.dart';

abstract class WarrantycodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends WarrantycodeState {}

class ErrorState extends WarrantycodeState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends WarrantycodeState {}
