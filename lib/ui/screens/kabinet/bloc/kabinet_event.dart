part of 'kabinet_bloc.dart';

abstract class KabinetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class KabinetGetEvent extends KabinetEvent {}
