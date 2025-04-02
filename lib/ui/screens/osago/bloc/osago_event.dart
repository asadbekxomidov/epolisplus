part of 'osago_bloc.dart';

abstract class OsagoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OsagoInfoGetEvent extends OsagoEvent {}

class SelectButtonEvent extends OsagoEvent {}

class ClearVehicleInfoEvent extends OsagoEvent {}

// ? STEP 2 EVENT

class SelectPolicyEvent extends OsagoEvent {}

class StartTimeEvent extends OsagoEvent {}

class EndTimeEvent extends OsagoEvent {}
