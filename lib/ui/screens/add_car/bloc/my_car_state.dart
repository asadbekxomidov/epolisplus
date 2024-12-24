part of 'my_car_bloc.dart';

class MyCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitialState extends MyCarState {}

class CarLoadingState extends MyCarState {}

class CarLoadedState extends MyCarState {}

class CarInformationGetState extends MyCarState {
  final CarInformationResponse response;

  CarInformationGetState(this.response);

  @override
  List<Object?> get props => [response];
}

class CarErrorState extends MyCarState {
  final String error;

  CarErrorState(this.error);
}

class CarSuccesState extends MyCarState {}
