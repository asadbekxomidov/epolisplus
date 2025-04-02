part of 'casko_buy_bloc.dart';

abstract class CaskoBuyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ? Vehicle Events

class VehicleGetEvent extends CaskoBuyEvent {}

// ? StepEvents

class NextStep2Event extends CaskoBuyEvent {}

class NextStep3Event extends CaskoBuyEvent {}

class NextStep4Event extends CaskoBuyEvent {}

class BackStep1Event extends CaskoBuyEvent {}

class BackStep2Event extends CaskoBuyEvent {}

class BackStep3Event extends CaskoBuyEvent {}

class BackStep4Event extends CaskoBuyEvent {}

// ? Get Phone Number Event

class GetPhoneNumberEvent extends CaskoBuyEvent {}

// ? Step 3 events

class IsCheckInsuranceEvent extends CaskoBuyEvent {}

class OpenOfertaPageEvent extends CaskoBuyEvent {}
