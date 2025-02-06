part of 'getW_bloc.dart';

abstract class GetWCodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends GetWCodeState {}

class LoadedState extends GetWCodeState {}

class ErrorState extends GetWCodeState {
  Failure failure;

  ErrorState({required this.failure});
}

class SuccessState extends GetWCodeState {}
