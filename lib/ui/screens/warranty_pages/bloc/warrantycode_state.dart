part of 'warrantycode_bloc.dart';

abstract class WarrantycodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends WarrantycodeState {}

class CalculatedState extends WarrantycodeState {
  final double percent;
  CalculatedState(this.percent);

  @override
  List<Object?> get props => [percent];
}

class ErrorState extends WarrantycodeState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends WarrantycodeState {}
