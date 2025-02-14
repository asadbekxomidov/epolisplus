part of 'add_car_bloc.dart';

class VehicleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitialState extends VehicleState {}

class CarLoadingState extends VehicleState {}

class CarLoadedState extends VehicleState {}

class CarInformationGetState extends VehicleState {
  CarInformationGetState();

  @override
  List<Object?> get props => [];
}

class CarErrorState extends VehicleState {
  Failure failure;

  CarErrorState(this.failure);
}

class CarSuccesState extends VehicleState {}
