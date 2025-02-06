part of 'select_warranty_bloc.dart';

abstract class SelectWarrantyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetWarrantyEvent extends SelectWarrantyEvent {}

class OpenWarrantyCodeEvent extends SelectWarrantyEvent {
  WarrantycodeResponse response;

  OpenWarrantyCodeEvent(this.response);
}
