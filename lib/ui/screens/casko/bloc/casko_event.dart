part of 'casko_bloc.dart';

abstract class CaskoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaskoGetEvent extends CaskoEvent {}
