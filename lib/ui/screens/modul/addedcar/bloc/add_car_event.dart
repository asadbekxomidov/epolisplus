part of 'add_car_bloc.dart';

class AddedCarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInfromationCarEvent extends AddedCarEvent {}

class RegisterCertificateNumberEvent extends AddedCarEvent {}

class ClearVehicleEvent extends AddedCarEvent {}
