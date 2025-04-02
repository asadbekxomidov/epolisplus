part of 'casko_buy_bloc.dart';

abstract class CaskoBuyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends CaskoBuyState {}

class LoadingState extends CaskoBuyState {}

class LoadedState extends CaskoBuyState {}

class ErrorState extends CaskoBuyState {}

class SuccesState extends CaskoBuyState {}
