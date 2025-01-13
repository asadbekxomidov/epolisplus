part of 'warrantycode_bloc.dart';

abstract class WarrantycodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WarrantycodeInitialState extends WarrantycodeState {}

class WarrantycodeLoadingState extends WarrantycodeState {}

class WarrantycodeLoadedState extends WarrantycodeState {}

class WarrantycodeErrorState extends WarrantycodeState {
  Failure failure;

  WarrantycodeErrorState(this.failure);
}

class WarrantycodeSuccesState extends WarrantycodeState {}
