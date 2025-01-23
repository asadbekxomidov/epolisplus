part of 'ref_warranty_bloc.dart';

abstract class RefWarrantyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends RefWarrantyState {}

class LoadedState extends RefWarrantyState {}

class ErrorState extends RefWarrantyState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends RefWarrantyState {}
