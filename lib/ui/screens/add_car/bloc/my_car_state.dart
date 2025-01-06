part of 'my_car_bloc.dart';

abstract class MyCarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyCarInitialState extends MyCarState {}

class MyCarLodingState extends MyCarState {}

class MyCarLoadedState extends MyCarState {}

class MyCarErrorState extends MyCarState {
  final String error;

  MyCarErrorState(this.error);
}

class MyCarSuccesState extends MyCarState {}
