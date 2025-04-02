part of 'travel_bloc.dart';

abstract class TravelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends TravelState {}

class LoadedState extends TravelState {}

class ErrorState extends TravelState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends TravelState {}

class CountriesUpdatedState extends TravelState {
  final List<String> updatedCountries;
  CountriesUpdatedState(this.updatedCountries);
}
