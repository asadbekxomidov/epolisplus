part of 'kabinet_bloc.dart';

abstract class KabinetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class KabinetInitialState extends KabinetState {}

class KabinetLoadingState extends KabinetState {}

class KabinetLoadedState extends KabinetState {}

class KabinetErrorState extends KabinetState {}
