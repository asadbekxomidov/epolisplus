part of 'select_warranty_bloc.dart';

abstract class SelectWarrantyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectWarrantyCodeEvent extends SelectWarrantyEvent {}

class OpenAvtoSinePageEvent extends SelectWarrantyEvent {}

class OpenPhoneWarrantyEvent extends SelectWarrantyEvent {}

class OpenRefrigeratorEvent extends SelectWarrantyEvent {}
