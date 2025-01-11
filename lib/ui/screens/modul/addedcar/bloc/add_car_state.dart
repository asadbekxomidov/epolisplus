part of 'add_car_bloc.dart';

class AddedCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitialState extends AddedCarState {}

class CarLoadingState extends AddedCarState {}

class CarLoadedState extends AddedCarState {}

class CarInformationGetState extends AddedCarState {

  CarInformationGetState();

  @override
  List<Object?> get props => [];
}

class CarErrorState extends AddedCarState {
  Failure failure;

  CarErrorState(this.failure);
}

class CarSuccesState extends AddedCarState {}
