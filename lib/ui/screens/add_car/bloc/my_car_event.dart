part of 'my_car_bloc.dart';

abstract class MyCarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyCarGetEvent extends MyCarEvent {}

class AddCarEvent extends MyCarEvent {}

class ClearCarInfoEvent extends MyCarEvent {}
