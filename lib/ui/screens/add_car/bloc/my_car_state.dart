part of 'my_car_bloc.dart';

class MyCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitialState extends MyCarState {}

class CarLoadingState extends MyCarState {}

class CarLoadedState extends MyCarState {}

class CarErrorState extends MyCarState {}

class CarSuccesState extends MyCarState {}
