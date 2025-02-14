part of 'bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ProductState {}

class LoadedState extends ProductState {}

class ErrorState extends ProductState {}

class SuccessState extends ProductState {}
