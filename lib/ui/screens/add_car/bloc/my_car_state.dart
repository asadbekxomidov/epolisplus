part of 'my_car_bloc.dart';

abstract class MyCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitialState extends MyCarState {}

class MyCarLodingState extends MyCarState {}

class CarLoadedState extends MyCarState {}

class MyCarErrorState extends MyCarState {
  Failure failure;

  MyCarErrorState(this.failure);
}

class CarSuccesState extends MyCarState {}
