part of 'phone_warranty_bloc.dart';

abstract class PhoneWarrantyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends PhoneWarrantyState {}

class LoadedState extends PhoneWarrantyState {}

class ErrorState extends PhoneWarrantyState {}

class SuccessState extends PhoneWarrantyState {}
