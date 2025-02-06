part of 'add_ser_bloc.dart';

abstract class AddSerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AddSerState {}

class LoadedState extends AddSerState {}

class ErrorState extends AddSerState {}

class SuccessState extends AddSerState {}
