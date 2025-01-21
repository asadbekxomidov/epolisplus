part of 'warrantycode_bloc.dart';

abstract class WarrantyCodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInformationWarrantyCodeEvent extends WarrantyCodeEvent {
  int position;
  GetInformationWarrantyCodeEvent(this.position);
}

class OpenScanningQrcodeEvent extends WarrantyCodeEvent {
  int position;
  OpenScanningQrcodeEvent(this.position);
}

class DeleteWarrantyCodeEvent extends WarrantyCodeEvent {
  int position;
  DeleteWarrantyCodeEvent(this.position);
}

class AddWarrantyCodeEvent extends WarrantyCodeEvent {}

class AddActiveteCodeEvent extends WarrantyCodeEvent {
  int position;
  AddActiveteCodeEvent(this.position);
}
