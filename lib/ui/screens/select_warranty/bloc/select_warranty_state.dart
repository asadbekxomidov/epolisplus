part of 'select_warranty_bloc.dart';

abstract class SelectWarrantyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SelectWarrantyState {}

class LoadedState extends SelectWarrantyState {}

class ErrorState extends SelectWarrantyState {}

class SuccessState extends SelectWarrantyState {}
