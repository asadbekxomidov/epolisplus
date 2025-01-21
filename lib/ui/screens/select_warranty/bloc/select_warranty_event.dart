part of 'select_warranty_bloc.dart';

abstract class SelectWarrantyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectWarrantyCodeEvent extends SelectWarrantyEvent {}

class OpenWarrantyScreen extends SelectWarrantyEvent {}
