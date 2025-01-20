part of 'travel_bloc.dart';

abstract class TravelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TravelInfoGetEvent extends TravelEvent {}
