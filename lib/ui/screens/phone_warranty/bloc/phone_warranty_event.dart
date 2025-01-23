part of 'phone_warranty_bloc.dart';

abstract class PhoneWarrantyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneWarrantyCodeInfoEvent extends PhoneWarrantyEvent {}

class DeleteActiveCodeEvent extends PhoneWarrantyEvent {
  int position;
  DeleteActiveCodeEvent(this.position);
}

class AddActivateCodeEvent extends PhoneWarrantyEvent {
  int position;
  AddActivateCodeEvent(this.position);
}


class OpenScanningQrcodeEvent extends PhoneWarrantyEvent {
  int position;
  OpenScanningQrcodeEvent(this.position);
}