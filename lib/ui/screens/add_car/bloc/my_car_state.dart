part of 'my_car_bloc.dart';

abstract class MyCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitialState extends MyCarState {}

class MyCarLodingState extends MyCarState {}

class MyCarLoadedState extends MyCarState {}

class MyCarErrorState extends MyCarState {
  Failure failure;

  MyCarErrorState(this.failure);
}

class MyCarSuccesState extends MyCarState {}
