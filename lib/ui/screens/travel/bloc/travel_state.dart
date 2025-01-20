part of 'travel_bloc.dart';

abstract class TravelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends TravelState {}

class LoadedState extends TravelState {}

class ErrorState extends TravelState {}

class SuccessState extends TravelState {}
