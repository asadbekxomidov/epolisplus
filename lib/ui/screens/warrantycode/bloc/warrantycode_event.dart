part of 'warrantycode_bloc.dart';

abstract class WarrantycodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WarrantycodeGetEvent extends WarrantycodeEvent {}

class WarrantycodePushScreenEvent extends WarrantycodeEvent {
  String? scannedData;

  WarrantycodePushScreenEvent({this.scannedData});
}

class WarrantycodeGetVehicleInfoEvent extends WarrantycodeEvent {}

class WarrantycodeQrCodeClearEvent extends WarrantycodeEvent {}

class WarrantycodeAddRowEvent extends WarrantycodeEvent {}
