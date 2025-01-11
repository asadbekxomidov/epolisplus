part of 'my_car_bloc.dart';

abstract class MyCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitialState extends MyCarState {}

class CarLodingState extends MyCarState {}

class CarLoadedState extends MyCarState {}

class MyCarErrorState extends MyCarState {
  final String error;

  MyCarErrorState(this.error);
}

class CarSuccesState extends MyCarState {}
