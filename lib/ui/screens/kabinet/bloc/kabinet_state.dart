// part of 'kabinet_bloc.dart';

// abstract class KabinetState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class KabinetInitialState extends KabinetState {}

// class KabinetLoadingState extends KabinetState {}

// class KabinetLoadedState extends KabinetState {}

// class KabinetInfotmationGetState extends KabinetState {}

// class KabinetErrorState extends KabinetState {}

part of 'kabinet_bloc.dart';

abstract class KabinetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class KabinetInitialState extends KabinetState {}

class KabinetLoadingState extends KabinetState {}

class KabinetInformationGetState extends KabinetState {
  final ProfilResponse profilResponse;

  KabinetInformationGetState({required this.profilResponse});

  @override
  List<Object?> get props => [profilResponse];
}

class KabinetErrorState extends KabinetState {
  final String message;

  KabinetErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class KabinetSuccesState extends KabinetState {}
