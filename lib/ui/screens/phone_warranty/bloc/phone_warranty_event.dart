part of 'phone_warranty_bloc.dart';

abstract class PhoneWarrantyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneWarrantyCodeInfoEvent extends PhoneWarrantyEvent {}
