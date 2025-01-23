part of 'ref_warranty_bloc.dart';

abstract class RefWarrantyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RefWarrantyCodeInfoEvent extends RefWarrantyEvent {}

class OpenScanningQrCodeEvent extends RefWarrantyEvent {
  int position;
  OpenScanningQrCodeEvent(this.position);
}

class DeleteActiveCodeEvent extends RefWarrantyEvent {
  int position;
  DeleteActiveCodeEvent(this.position);
}

class AddActivateCodeEvent extends RefWarrantyEvent {
  int position;
  AddActivateCodeEvent(this.position);
}
