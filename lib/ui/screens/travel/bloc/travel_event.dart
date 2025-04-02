part of 'travel_bloc.dart';

abstract class TravelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TravelInfoGetEvent extends TravelEvent {}

class SelectedTravelTimeEvent extends TravelEvent {}

class CountriesAddEvent extends TravelEvent {}

class TravelStartTimeEvent extends TravelEvent {}

class SelectDatesEvent extends TravelEvent {}

class TravelEndTimeEvent extends TravelEvent {}

class SelectCountriesTypeEvent extends TravelEvent {}

class RemoveCountriesEvent extends TravelEvent {
  int index;

  RemoveCountriesEvent(this.index);
}

class CalculateDaysDifferenceEvent extends TravelEvent {}

// ? Contract Event

class ContractVerticalEvent extends TravelEvent {}

class SelectServiceEvent extends TravelEvent {}

// ? NextStepEvent

class NextStep2Event extends TravelEvent {}

class NextStep3Event extends TravelEvent {}

class NextStep4Event extends TravelEvent {}

// ? UserInfo Events

class IsCheckUserInfoUIEvent extends TravelEvent {}

class IsCheckUserTravelEvent extends TravelEvent {}

class IsCheckFamilyTravelEvent extends TravelEvent {}

class AddUserTravelEvent extends TravelEvent {}
