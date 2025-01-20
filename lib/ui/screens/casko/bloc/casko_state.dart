part of 'casko_bloc.dart';

abstract class CaskoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CaskoState {}

class LoadedState extends CaskoState {}

class ErrorState extends CaskoState {}

class SuccessState extends CaskoState {}
